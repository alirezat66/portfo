import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/glow_card.dart';
import 'package:portfolio/features/testimonial/model/testimonial.dart';
import 'package:portfolio/features/testimonial/view/testimonial_widget.dart';
import 'package:portfolio/widgets/responsive_content.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = Testimonial.testimonials;

    // Get different number of testimonials based on screen size
    final displayedTestimonials =
        _getDisplayedTestimonials(context, testimonials);

    return Column(
      spacing: 32,
      children: [
        Text(
          'Testimonials',
          style: TextStyle(
              color: context.basicColors.textSecondaryColor,
              fontSize: 44,
              fontFamily: 'Zodiak',
              fontWeight: FontWeight.bold),
        ),
        _buildTestimonialLayout(context, displayedTestimonials),
        ElevatedButton(
          onPressed: () {
            // Navigate to all projects page
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Color(0xFF404040), width: 1),
            ),
          ),
          child: const Text(
            'See All Works',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  List<Testimonial> _getDisplayedTestimonials(
      BuildContext context, List<Testimonial> testimonials) {
    if (context.isDesktop) {
      return testimonials.take(3).toList(); // 3 items for desktop
    } else if (context.isLaptop) {
      return testimonials.take(2).toList(); // 2 items for laptop
    } else {
      return testimonials
          .take(3)
          .toList(); // 3 items for tablet/mobile (in column)
    }
  }

  Widget _buildTestimonialLayout(
      BuildContext context, List<Testimonial> testimonials) {
    if (context.isTablet || context.isMobile) {
      // Column layout for tablet and mobile
      return Column(
        spacing: 24,
        children: testimonials
            .map((testimonial) =>
                GlowCard(child: TestimonialWidget(testimonial: testimonial)))
            .toList(),
      );
    } else {
      // Row layout for desktop and laptop
      return IntrinsicHeight(
        child: Row(
          spacing: 24,
          children: testimonials
              .map((testimonial) => Expanded(
                  child: GlowCard(
                      child: TestimonialWidget(testimonial: testimonial))))
              .toList(),
        ),
      );
    }
  }
}
