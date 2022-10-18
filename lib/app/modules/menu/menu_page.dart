import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_controller.dart';
import 'widgets/product_tile.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView.builder(
            itemBuilder: (_, index) {
              final product = controller.menu[index];

              return ProductTile(product: product);
            },
            itemCount: controller.menu.length,
          ),
        ),
      ),
    );
  }
}
