import 'package:flutter/material.dart';
import 'package:portfolio/core/models/availability_status.dart';
import 'package:portfolio/widgets/availability_widget.dart';

class ProfileHighlights extends StatelessWidget {
  const ProfileHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    if (isDesktop) {
      return _buildDesktopLayout();
    } else if (isTablet) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AvailabilityWidget(status: AvailabilityStatus.available),
          const SizedBox(height: 32),
          const Text(
            "I'm James Parker.",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(text: "I Code "),
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Create"),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Innovate."),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Empowering Ideas Through End-to-End\nDevelopment Expertise and Seamless User\nInterfaces",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFB3B3B3),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDBA72),
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AvailabilityWidget(status: AvailabilityStatus.available),
          const SizedBox(height: 24),
          const Text(
            "I'm James Parker.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(text: "I Code "),
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Create"),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Innovate."),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Empowering Ideas Through End-to-End Development\nExpertise and Seamless User Interfaces",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFB3B3B3),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDBA72),
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Start a Project",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  side: const BorderSide(color: Color(0xFF404040)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Browse Works",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AvailabilityWidget(status: AvailabilityStatus.available),
          const SizedBox(height: 20),
          const Text(
            "I'm James Parker.",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(text: "I Code "),
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Create"),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.1,
              ),
              children: [
                TextSpan(
                  text: "* ",
                  style: TextStyle(color: Color(0xFFFDBA72)),
                ),
                TextSpan(text: "Innovate."),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Empowering Ideas Through End-to-End Development Expertise and Seamless User Interfaces",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFB3B3B3),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDBA72),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Start a Project",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: Color(0xFF404040)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Browse Works",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
