import 'shopping_cart_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCartModel> items;

  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
