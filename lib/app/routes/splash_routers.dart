import 'package:get/get.dart';
import '../modules/splash/splash_bindings.dart';
import '../modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routes = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
