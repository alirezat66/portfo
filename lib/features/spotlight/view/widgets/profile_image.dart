import 'package:flutter/material.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/social_item/social_item_widget.dart';
import 'package:portfolio/features/about/models/social.dart';
import 'package:portfolio/features/spotlight/model/data/profile.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ProfileImage extends StatelessWidget {
  final Profile profile;

  const ProfileImage({
    super.key,
    required this.profile,
  });

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
                    child: _buildProfileImage(profile.profileImagePath,
                        profile.profileImageHoverPath),
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
                    children: profile.socialLinks.take(3).map((socialLink) {
                      return SocialIconWidget.circle(
                        context,
                        _createSocialFromLink(socialLink),
                        radius: context.isDesktop ? 24.0 : 20.0,
                        iconSize: context.isDesktop ? 24.0 : 16.0,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
  }

  Widget _buildProfileImage(String imageUrl, String hoverImageUrl) {
    if (imageUrl.isEmpty) {
      return const Icon(Icons.person, size: 100);
    }

    // Check if it's a network URL or local asset
    if (imageUrl.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(1000), // Make it circular
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person, size: 100);
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
        ).changeWidgetOnHover(Image.network(hoverImageUrl)),
      );
    } else {
      return Image.asset(imageUrl);
    }
  }

  Social _createSocialFromLink(SocialLink socialLink) {
    return Social(
      url: socialLink.url,
      icon: socialLink.iconPath,
      tooltip: socialLink.tooltip,
    );
  }
}
