import 'package:flutter/material.dart';
import 'package:portfolio/core/services/download_service.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class DownloadButton extends StatefulWidget {
  final String text;
  final String? fileName;
  final String? assetPath;
  final IconData? icon;
  final bool isResume;
  final VoidCallback? onPressed;
  final bool isLoading;

  const DownloadButton({
    super.key,
    this.text = 'Download Resume',
    this.fileName,
    this.assetPath,
    this.icon,
    this.isResume = true,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isDownloading = false;

  Future<void> _handleDownload() async {
    if (widget.onPressed != null) {
      widget.onPressed!();
      return;
    }

    setState(() {
      _isDownloading = true;
    });

    try {
      if (widget.isResume) {
        await DownloadService.downloadResume();
      } else if (widget.assetPath != null && widget.fileName != null) {
        await DownloadService.downloadPdf(widget.assetPath!, widget.fileName!);
      }

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.text} downloaded successfully!'),
            backgroundColor: context.basicColors.surfaceBrandColor,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = widget.isLoading || _isDownloading;

    return ElevatedButton.icon(
      onPressed: isLoading ? null : _handleDownload,
      icon: isLoading
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.basicColors.surfaceBrandColor,
                ),
              ),
            )
          : Icon(
              widget.icon ?? Icons.download,
              size: 18,
            ),
      label: Text(
        isLoading ? 'Downloading...' : widget.text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.basicColors.surfaceBrandColor,
        foregroundColor: context.colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
    );
  }
}

class DownloadIconButton extends StatefulWidget {
  final String? fileName;
  final String? assetPath;
  final bool isResume;
  final VoidCallback? onPressed;
  final double size;
  final String tooltip;

  const DownloadIconButton({
    super.key,
    this.fileName,
    this.assetPath,
    this.isResume = true,
    this.onPressed,
    this.size = 24,
    this.tooltip = 'Download Resume',
  });

  @override
  State<DownloadIconButton> createState() => _DownloadIconButtonState();
}

class _DownloadIconButtonState extends State<DownloadIconButton> {
  bool _isDownloading = false;

  Future<void> _handleDownload() async {
    if (widget.onPressed != null) {
      widget.onPressed!();
      return;
    }

    setState(() {
      _isDownloading = true;
    });

    try {
      if (widget.isResume) {
        await DownloadService.downloadResume();
      } else if (widget.assetPath != null && widget.fileName != null) {
        await DownloadService.downloadPdf(widget.assetPath!, widget.fileName!);
      }

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Download completed successfully!'),
            backgroundColor: context.basicColors.surfaceBrandColor,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: IconButton(
        onPressed: _isDownloading ? null : _handleDownload,
        icon: _isDownloading
            ? SizedBox(
                width: widget.size,
                height: widget.size,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.basicColors.surfaceBrandColor,
                  ),
                ),
              )
            : Icon(
                Icons.download,
                size: widget.size,
                color: context.basicColors.textSecondaryColor,
              ),
      ),
    );
  }
}
