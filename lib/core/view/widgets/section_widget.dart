import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class SectionWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final VoidCallback? onMore;
  final String? moreText;
  const SectionWidget(
      {super.key,
      required this.child,
      required this.title,
      this.onMore,
      this.moreText});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 56, children: [
      Text(
        title,
        style: TextStyle(
          color: context.basicColors.textSecondaryColor,
          fontSize: 44,
          fontFamily: 'Zodiak',
          fontWeight: FontWeight.bold,
        ),
      ),
      child,
      if (onMore != null)
        ElevatedButton(
          onPressed: () {
            // Navigate to all articles page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Color(0xFF404040), width: 1),
            ),
          ),
          child: const Text(
            'Read All Articles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      SizedBox(),
    ]);
  }
}
