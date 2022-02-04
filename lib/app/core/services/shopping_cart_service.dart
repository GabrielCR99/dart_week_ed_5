import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../models/shopping_cart_model.dart';

class ShoppingCartService extends GetxService {
  final _shoppingCart = <int, ShoppingCartModel>{}.obs;

  List<ShoppingCartModel> get products => _shoppingCart.values.toList();

  int get totalProducts => _shoppingCart.values.length;

  ShoppingCartModel? getById(int id) => _shoppingCart[id];

  void addAndRemoveProductInShoppingCart(
    ProductModel product, {
    required int amount,
  }) {
    if (amount == 0) {
      _shoppingCart.remove(product.id);
    } else {
      _shoppingCart.update(
        product.id,
        (product) {
          product.amount = amount;
          return product;
        },
        ifAbsent: () => ShoppingCartModel(amount: amount, product: product),
      );
    }
  }
}
