import 'package:flutter/material.dart';
import 'package:portfolio/core/view/widgets/social_item/social_item_widget.dart';
import 'package:portfolio/features/about/model/data/about_data.dart';
import 'package:portfolio/features/about/models/social.dart';

class SocialView extends StatelessWidget {
  final AboutData aboutData;

  const SocialView({
    super.key,
    required this.aboutData,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: aboutData.socialLinks.map((socialLink) {
          // Convert SocialLink to Social for compatibility
          Social social = Social(
            icon: socialLink.iconPath,
            url: socialLink.url,
            tooltip: socialLink.tooltip,
          );
          return SocialIconWidget.card(context, social);
        }).toList(),
      ),
    );
  }
}
