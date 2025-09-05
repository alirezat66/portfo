import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/increase_hover_ext.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        // Profile image with border
        SizedBox(
          width: 340 + 56 / 2,
          height: 340 + 56 / 2,
        ),
        Container(
          width: 340,
          height: 340,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFB9925F),
              width: 20,
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
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF262626).withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
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
    return Tooltip(
      message: tooltip,
      child: CircleAvatar(
        radius: 24,
        backgroundColor: context.colorScheme.surface,
        child: GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(url));
          },
          child: SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
        ),
      ).increaseSizeOnHover(1.2),
    );
  }
}
