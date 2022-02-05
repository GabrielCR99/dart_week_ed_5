import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/order/finished/finished_page.dart';
import '../modules/order/pix/pix_page.dart';

class OrdersRoutes {
  OrdersRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    ),
  ];
}
