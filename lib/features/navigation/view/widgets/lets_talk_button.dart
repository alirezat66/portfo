import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class LetsTalkButton extends StatelessWidget {
  const LetsTalkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: context.colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            launchUrl(
                Uri.parse('https://calendar.app.google/HaH4cXhhioPmD6C99'));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Let's Talk",
                  style: TextStyle(
                    color: context.colorScheme.surface,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_outward,
                    color: context.colorScheme.surface, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
