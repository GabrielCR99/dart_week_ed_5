import 'package:get/get.dart';

import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import 'menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<ProductRepository>(
        () => ProductRepositoryImpl(restClient: Get.find()),
      )
      ..lazyPut<MenuController>(() => MenuController(repository: Get.find()));
  }
}
