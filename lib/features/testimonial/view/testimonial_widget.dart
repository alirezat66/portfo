import 'package:flutter/material.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';
import 'package:portfolio/core/view/widgets/card_widget.dart';
import 'package:portfolio/features/testimonial/model/data/testimonial.dart';

class TestimonialWidget extends StatelessWidget {
  final Testimonial testimonial;
  const TestimonialWidget({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(testimonial.colleague.image),
                radius: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.colleague.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: context.basicColors.textPrimaryColor),
                  ),
                  Text(
                    testimonial.colleague.role,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: context.basicColors.textSecondaryColor),
                  ),
                ],
              )
            ],
          ),
          Text('“${testimonial.shortQuote}”',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: context.basicColors.textPrimaryColor)),
        ],
      ),
    ));
  }
}
