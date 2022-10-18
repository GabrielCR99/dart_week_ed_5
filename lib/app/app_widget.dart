import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/bindings/application_binding.dart';
import 'core/ui/vakinha_ui.dart';
import 'routes/auth_routes.dart';
import 'routes/home_routes.dart';
import 'routes/orders_routes.dart';
import 'routes/product_routes.dart';
import 'routes/splash_routers.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      initialBinding: ApplicationBinding(),
      theme: VakinhaUi.themeData,
      getPages: [
        ...SplashRouters.routes,
        ...AuthRoutes.routers,
        ...HomeRoutes.routers,
        ...ProductRoutes.routers,
        ...OrdersRoutes.routers,
      ],
      locale: const Locale('pt', 'BR'),
    );
  }
}
