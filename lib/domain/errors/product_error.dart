class ProductError implements Exception {
  final String message;
  final int? statusCode;

  ProductError({required this.message, this.statusCode});

  @override
  String toString() => message;
}
