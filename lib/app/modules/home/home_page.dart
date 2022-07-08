import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/widgets/custom_app_bar.dart';
import '../../core/ui/widgets/icon_badge.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CustomAppBar(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.index,
          items: [
            const BottomNavigationBarItem(
              label: 'Produtos',
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: 'Carrinho',
              icon: IconBadge(
                icon: Icons.shopping_cart,
                number: controller.totalProductsInCart,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'Sair',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
          onTap: (value) => controller.tabIndex = value,
        ),
      ),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.navigatorKey),
        onGenerateRoute: controller.onGenerateRoute,
      ),
    );
  }
}
