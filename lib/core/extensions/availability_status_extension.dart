import '../models/availability_status.dart';

extension AvailabilityStatusExtension on dynamic {
  /// Converts API availability status string to AvailabilityStatus enum
  AvailabilityStatus toAvailabilityStatus() {
    if (this == null) return AvailabilityStatus.available;

    final status = toString().toLowerCase();
    switch (status) {
      case 'available':
        return AvailabilityStatus.available;
      case 'partiallyavailable':
      case 'partially_available':
        return AvailabilityStatus.partiallyAvailable;
      case 'fullybusy':
      case 'fully_busy':
        return AvailabilityStatus.fullyBusy;
      default:
        return AvailabilityStatus.available;
    }
  }
}
