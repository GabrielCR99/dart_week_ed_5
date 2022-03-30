import 'shopping_cart_model.dart';

class Order {
  final int userId;
  final String cpf;
  final String address;
  final List<ShoppingCartModel> items;

  const Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
