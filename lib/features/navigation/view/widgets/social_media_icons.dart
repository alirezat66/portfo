import 'package:flutter/material.dart';
import 'package:portfolio/core/view/widgets/social_item/social_item_widget.dart';
import 'package:portfolio/features/about/models/social.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        SocialIconWidget.circle(context, Social.github()),
        SocialIconWidget.circle(context, Social.linkedIn()),
        SocialIconWidget.circle(context, Social.youtube()),
      ],
    );
  }
}
