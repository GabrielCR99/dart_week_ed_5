import 'package:get/get.dart';
import '../services/shopping_cart_service.dart';
import '../rest_client/rest_client.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => RestClient(), fenix: true)
      ..lazyPut(() => ShoppingCartService());
  }
}
