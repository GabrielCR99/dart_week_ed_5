import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/product_routes.dart';
import 'app/routes/home_routes.dart';
import 'app/core/bindings/application_binding.dart';

import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/auth_routes.dart';
import 'app/routes/splash_routers.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

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
      ],
      locale: const Locale('pt', 'BR'),
    );
  }
}
