import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/about/models/social.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconWidget {
  static Widget card(BuildContext context, Social social,
      {double iconSize = 32}) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(social.url)),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.basicColors.backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.basicColors.surfaceBrandColor
                      .withValues(alpha: 0.3),
                  width: isHovered ? 3 : 1,
                ),
              ),
              child: SvgPicture.asset(
                social.icon,
                width: iconSize,
                height: iconSize,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(
                    context.basicColors.textSecondaryColor, BlendMode.srcIn),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget circle(
    BuildContext context,
    Social social, {
    double iconSize = 20,
    double radius = 20,
  }) {
    bool isHovered = false;
    return StatefulBuilder(builder: (context, setState) {
      return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Tooltip(
          message: social.tooltip,
          child: GestureDetector(
            onTap: () => launchUrl(Uri.parse(social.url)),
            child: CircleAvatar(
              radius: iconSize,
              backgroundColor: context.basicColors.surfaceTertiaryColor,
              child: SvgPicture.asset(
                social.icon,
                colorFilter: ColorFilter.mode(
                    context.colorScheme.onTertiary, BlendMode.srcIn),
                width: iconSize * (isHovered ? 1.1 : 1),
                height: iconSize * (isHovered ? 1.1 : 1),
              ),
            ),
          ),
        ),
      );
    });
  }

  // Easy to add new styles without modifying existing code
  static Widget minimal(BuildContext context, Social social, double iconSize) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(social.url)),
      child: SvgPicture.asset(
        social.icon,
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(
            context.basicColors.textSecondaryColor, BlendMode.srcIn),
      ),
    );
  }
}
