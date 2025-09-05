import 'package:flutter/material.dart';
import 'package:portfolio/features/home/spotlight/widgets/profile_highlights.dart';
import 'package:portfolio/features/home/spotlight/widgets/profile_image.dart';

class SpotlightView extends StatelessWidget {
  const SpotlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ProfileHighlights()),
        const SizedBox(width: 40),
        ProfileImage(),
      ],
    );
  }
}
