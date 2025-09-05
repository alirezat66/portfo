import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/gen/assets.gen.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSocialIcon(context, Assets.icons.github.path,
            'https://github.com/alirezat66', 'Github'),
        const SizedBox(width: 12),
        _buildSocialIcon(context, Assets.icons.linkedin.path,
            'https://www.linkedin.com/in/alirezat66/', 'LinkedIn'),
        const SizedBox(width: 12),
        _buildSocialIcon(
          context,
          Assets.icons.youtube.path,
          'https://www.youtube.com/@taghiTechTalks',
          'Youtube',
        ),
      ],
    );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    String icon,
    String url,
    String tooltip,
  ) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(url));
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: context.colorScheme.tertiary,
          child: SvgPicture.asset(
            icon,
            color: context.colorScheme.onTertiary,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
