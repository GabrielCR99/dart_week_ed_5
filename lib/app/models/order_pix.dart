class OrderPix {
  final String image;
  final String code;
  final double totalValue;

  const OrderPix({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  factory OrderPix.fromMap(Map<String, dynamic> map) => OrderPix(
        image: map['image'] ?? '',
        code: map['code'] ?? '',
        totalValue: map['totalValue']?.toDouble() ?? 0.0,
      );

  OrderPix copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) =>
      OrderPix(
        image: image ?? this.image,
        code: code ?? this.code,
        totalValue: totalValue ?? this.totalValue,
      );
}
