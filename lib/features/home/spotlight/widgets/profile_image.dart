import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/widgets/responsive_content.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hide on tablet and mobile
    if (context.isTablet || context.isMobile) {
      return const SizedBox.shrink();
    }

    return context.isTablet || context.isMobile
        ? const SizedBox.shrink()
        : Stack(
            alignment: AlignmentGeometry.topCenter,
            children: [
              // Profile image with border
              SizedBox(
                width: context.isDesktop ? 340.9 : 240.0,
                height: context.isDesktop ? 340.9 + 56.0 / 2 : 240.0 + 56.0 / 2,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: context.isDesktop ? 340.9 : 240.0,
                height: context.isDesktop ? 340.9 : 240.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFB9925F),
                    width: 20.0,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(Assets.images.profileImage.path)
                        .changeWidgetOnHover(
                            duration: const Duration(milliseconds: 500),
                            Image.asset(Assets.images.profileImageHover.path)),
                  ),
                ),
              ), // Social media icons container
              Positioned(
                bottom: context.isDesktop ? 0 : 56.0 / 3,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.isDesktop ? 8.0 : 6.0,
                    vertical: context.isDesktop ? 8.0 : 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: context.basicColors.surfaceTertiaryColor
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: context.isDesktop ? 16.0 : 12.0,
                    children: [
                      _buildSocialIcon(
                        context,
                        Assets.icons.github.path,
                        'https://github.com/alirezat66',
                        'Github',
                      ),
                      _buildSocialIcon(
                        context,
                        Assets.icons.linkedin.path,
                        'https://www.linkedin.com/in/alirezat66/',
                        'LinkedIn',
                      ),
                      _buildSocialIcon(
                        context,
                        Assets.icons.youtube.path,
                        'https://www.youtube.com/@taghiTechTalks',
                        'Youtube',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    String iconPath,
    String url,
    String tooltip,
  ) {
    final double iconRadius = context.isDesktop ? 24.0 : 20.0;
    final double iconSize = context.isDesktop ? 20.0 : 16.0;

    return Tooltip(
      message: tooltip,
      child: CircleAvatar(
        radius: iconRadius,
        backgroundColor: context.colorScheme.surface,
        child: GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(url));
          },
          child: SvgPicture.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
          ),
        ),
      ).increaseSizeOnHover(1.2),
    );
  }
}
