import 'package:flutter/material.dart';
import 'package:portfolio/core/view/widgets/download_button.dart';
import 'package:portfolio/features/spotlight/model/data/profile.dart';
import 'package:portfolio/features/spotlight/view/widgets/profile_info_highlight.dart';
import 'package:portfolio/widgets/availability_widget.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ProfileHighlights extends StatelessWidget {
  final Profile profile;

  const ProfileHighlights({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop || context.isLaptop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: 24,
      children: [
        AvailabilityWidget(status: profile.availabilityStatus),
        ProfileInfoHighlight(profile: profile),
        Row(
          mainAxisAlignment: context.isDesktop || context.isLaptop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            DownloadButton(
              text: "Download CV",
              isResume: true,
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                side: const BorderSide(color: Color(0xFF404040)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Browse Works",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
