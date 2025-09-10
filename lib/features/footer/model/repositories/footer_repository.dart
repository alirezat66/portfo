import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/footer_data.dart';

abstract class FooterRepository {
  Future<FooterData> getFooterData();
  Future<Copyright> getCopyright();
  Future<List<SocialLink>> getSocialLinks();
  Future<List<NavigationLink>> getNavigationLinks();
  Future<ContactInfo> getContactInfo();
  Future<List<QuickLink>> getQuickLinks();
}

class FooterRepositoryImpl implements FooterRepository {
  @override
  Future<FooterData> getFooterData() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(milliseconds: 100));

      // Load JSON from assets
      final String jsonString =
          await rootBundle.loadString('assets/data/footer.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Parse JSON to FooterData object
      return FooterData.fromJson(jsonData);
    } catch (e) {
      // If JSON loading fails, throw an error
      throw Exception('Failed to load footer data: $e');
    }
  }

  @override
  Future<Copyright> getCopyright() async {
    final footerData = await getFooterData();
    return footerData.copyright;
  }

  @override
  Future<List<SocialLink>> getSocialLinks() async {
    final footerData = await getFooterData();
    return footerData.socialLinks;
  }

  @override
  Future<List<NavigationLink>> getNavigationLinks() async {
    final footerData = await getFooterData();
    return footerData.navigationLinks;
  }

  @override
  Future<ContactInfo> getContactInfo() async {
    final footerData = await getFooterData();
    return footerData.contactInfo;
  }

  @override
  Future<List<QuickLink>> getQuickLinks() async {
    final footerData = await getFooterData();
    return footerData.quickLinks;
  }
}
