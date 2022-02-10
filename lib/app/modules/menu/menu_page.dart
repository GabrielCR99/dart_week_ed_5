import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'widgets/product_tile.dart';
import './menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return RefreshIndicator(
            onRefresh: () => controller.refreshPage(),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = controller.menu[index];
                return ProductTile(product: product);
              },
              itemCount: controller.menu.length,
            ),
          );
        },
      ),
    );
  }
}
