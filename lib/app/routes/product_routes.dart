import 'package:get/get.dart';
import '../modules/product_detail/product_detail_bindings.dart';
import '../modules/product_detail/product_detail_page.dart';

class ProductRoutes {
  ProductRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product-detail',
      page: () => const ProductDetailPage(),
      binding: ProductDetailBindings(),
    ),
  ];
}
