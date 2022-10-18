import 'package:get/get.dart';

import '../rest_client/rest_client.dart';
import '../services/shopping_cart_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(RestClient.new, fenix: true)
      ..lazyPut(ShoppingCartService.new);
  }
}
