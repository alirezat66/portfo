import 'package:flutter/material.dart';
import 'package:portfolio/core/models/availability_status.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/home/spotlight/widgets/profile_info_highlight.dart';
import 'package:portfolio/widgets/availability_widget.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class ProfileHighlights extends StatelessWidget {
  const ProfileHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop || context.isLaptop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: 24,
      children: [
        const AvailabilityWidget(status: AvailabilityStatus.available),
        const ProfileInfoHighlight(),
        Row(
          mainAxisAlignment: context.isDesktop || context.isLaptop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: context.surfaceBrandColor,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Start a Project",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
