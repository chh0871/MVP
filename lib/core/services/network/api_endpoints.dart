class ApiEndpoints {
  static const String products = '/products';

  // Versioned endpoints (if we need API versioning)
  static const String apiVersion = 'v1';
  static String versioned(String endpoint) => '/$apiVersion$endpoint';

  static const String categories = '/categories';
  static const String inpostLockers = '/shipping/inpost/lockers';
}
