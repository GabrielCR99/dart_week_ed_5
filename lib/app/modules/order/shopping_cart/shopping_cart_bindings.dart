import 'package:get/get.dart';
import '../../../repositories/order/order_repository.dart';
import '../../../repositories/order/order_repository_impl.dart';
import 'shopping_cart_controller.dart';

class ShoppingCartBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()),
      )
      ..put(
        ShoppingCartController(
          authService: Get.find(),
          shoppingCartService: Get.find(),
          repository: Get.find(),
        ),
      );
  }
}
