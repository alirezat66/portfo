import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadService {
  static Future<void> downloadPdf(String assetPath, String fileName) async {
    try {
      if (kIsWeb) {
        // For web platform
        await _downloadPdfWeb(assetPath, fileName);
      } else {
        // For mobile platforms, you might want to use different approach
        throw UnsupportedError('PDF download not supported on this platform');
      }
    } catch (e) {
      throw Exception('Failed to download PDF: $e');
    }
  }

  static Future<void> _downloadPdfWeb(String assetPath, String fileName) async {
    try {
      // Create a downloadable link using dart:html
      html.AnchorElement(href: assetPath)
        ..setAttribute('download', fileName)
        ..click();
    } catch (e) {
      throw Exception('Failed to download PDF on web: $e');
    }
  }

  static Future<void> downloadResume() async {
    const String assetPath = 'assets/data/cv.pdf';
    const String fileName = 'Reza_Taghizadeh_Resume.pdf';

    await downloadPdf(assetPath, fileName);
  }

  static Future<void> openPdfInNewTab(String assetPath) async {
    try {
      if (kIsWeb) {
        // For web, we can try to open the PDF in a new tab
        // First, we need to serve the asset through a URL
        final Uri assetUri = Uri.parse('/$assetPath');
        if (await canLaunchUrl(assetUri)) {
          await launchUrl(assetUri, mode: LaunchMode.externalApplication);
        } else {
          // Fallback to download
          await downloadResume();
        }
      } else {
        throw UnsupportedError('PDF viewing not supported on this platform');
      }
    } catch (e) {
      throw Exception('Failed to open PDF: $e');
    }
  }
}
