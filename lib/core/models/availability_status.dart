import 'package:flutter/material.dart';

enum AvailabilityStatus {
  available,
  partiallyAvailable,
  fullyBusy;

  String get displayText {
    switch (this) {
      case AvailabilityStatus.available:
        return 'Available for Work';
      case AvailabilityStatus.partiallyAvailable:
        return 'Partially Available';
      case AvailabilityStatus.fullyBusy:
        return 'Fully Busy';
    }
  }

  Color get color {
    switch (this) {
      case AvailabilityStatus.available:
        return const Color(0xFF22C55E); // Green
      case AvailabilityStatus.partiallyAvailable:
        return const Color(0xFFF59E0B); // Amber
      case AvailabilityStatus.fullyBusy:
        return const Color(0xFFEF4444); // Red
    }
  }

  IconData get icon {
    switch (this) {
      case AvailabilityStatus.available:
        return Icons.check_circle;
      case AvailabilityStatus.partiallyAvailable:
        return Icons.schedule;
      case AvailabilityStatus.fullyBusy:
        return Icons.cancel;
    }
  }
}
