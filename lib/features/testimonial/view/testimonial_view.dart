import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/features/testimonial/model/testimonial.dart';
import 'package:portfolio/features/testimonial/view/testimonial_widget.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({super.key});

  @override
  Widget build(BuildContext context) {
    final testimonials = Testimonial.testimonials.sublist(0, 3);
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
        IntrinsicHeight(
          child: Row(
            spacing: 24,
            children: [
              ...testimonials.map((testimonial) =>
                  Expanded(child: TestimonialWidget(testimonial: testimonial))),
            ],
          ),
        ),
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
}
