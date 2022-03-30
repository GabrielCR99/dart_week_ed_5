import 'product_model.dart';

class ShoppingCartModel {
  final ProductModel product;
  int amount;

  ShoppingCartModel({
    required this.amount,
    required this.product,
  });
}
