import 'package:flutter/material.dart';
import 'package:portfolio/core/view/widgets/social_item/social_item_widget.dart';
import 'package:portfolio/features/about/models/social.dart';

class SocialView extends StatelessWidget {
  const SocialView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        crossAxisCount:  2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          SocialIconWidget.card(context, Social.linkedIn()),
          SocialIconWidget.card(context, Social.github()),
          SocialIconWidget.card(context, Social.telegram()),
          SocialIconWidget.card(context, Social.medium()),
        ],
      ),
    );
  }
}
