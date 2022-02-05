class OrderPix {
  String image;
  String code;
  double totalValue;

  OrderPix({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() =>
      'OrderPix(image: $image, code: $code, totalValue: $totalValue)';

  OrderPix copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) {
    return OrderPix(
      image: image ?? this.image,
      code: code ?? this.code,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
