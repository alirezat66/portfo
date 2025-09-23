extension ImageUrlExtension on dynamic {
  /// Converts API image data to full URL
  String toImageUrl() {
    if (this == null) return '';
    if (this is Map<String, dynamic>) {
      final url = (this as Map<String, dynamic>)['url'] as String?;
      return url != null ? 'https://cms.taghizadeh.dev$url' : '';
    }
    return '';
  }
}
