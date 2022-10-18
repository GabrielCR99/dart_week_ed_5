import 'package:get/get.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';
import '../modules/menu/menu_bindings.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
      bindings: [MenuBindings()],
    ),
  ];
}
