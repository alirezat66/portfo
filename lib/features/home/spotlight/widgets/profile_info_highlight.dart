import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ProfileInfoHighlight extends StatelessWidget {
  const ProfileInfoHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: context.isDesktop || context.isLaptop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: context.isDesktop || context.isLaptop
              ? TextAlign.start
              : TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: context.isDesktop
                  ? 64
                  : context.isLaptop
                      ? 48
                      : context.isTablet
                          ? 32
                          : 24,
              fontWeight: FontWeight.w100,
              fontFamily: 'Zodiak',
              color: context.colorScheme.onPrimary,
              height: 1.1,
            ),
            children: [
              const TextSpan(text: "I'm James Parker"),
              TextSpan(
                text: ".\n",
                style: TextStyle(color: context.surfaceBrandColor),
              ),
              const TextSpan(text: "I Code "),
              TextSpan(
                text: "* ",
                style: TextStyle(color: context.surfaceBrandColor),
              ),
              const TextSpan(text: "Create\n"),
              TextSpan(
                text: "* ",
                style: TextStyle(color: context.surfaceBrandColor),
              ),
              const TextSpan(text: "Innovate."),
            ],
          ),
        ),
        Text(
          "Empowering Ideas Through End-to-End\nDevelopment Expertise and Seamless User\nInterfaces",
          textAlign: context.isDesktop || context.isLaptop
              ? TextAlign.start
              : TextAlign.center,
          style: TextStyle(
            fontSize: context.isDesktop || context.isLaptop ? 18 : 16,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurface,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
