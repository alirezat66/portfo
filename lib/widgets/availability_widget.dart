import 'package:flutter/material.dart';
import 'package:portfolio/core/models/availability_status.dart';
import 'package:portfolio/core/view/theme/theme_extension.dart';

class AvailabilityWidget extends StatelessWidget {
  final AvailabilityStatus status;

  const AvailabilityWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(
          color: const Color(0xFF737373),
          width: 0.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: status.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            status.displayText,
            style: const TextStyle(
              color: Color(0xFFF5F5F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
