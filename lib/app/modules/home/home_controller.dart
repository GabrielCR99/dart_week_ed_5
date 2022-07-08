import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/auth_service.dart';
import '../../core/services/shopping_cart_service.dart';
import '../menu/menu_page.dart';
import '../order/shopping_cart/shopping_cart_bindings.dart';
import '../order/shopping_cart/shopping_cart_page.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;
  final ShoppingCartService _service;

  HomeController({required ShoppingCartService service}) : _service = service;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_cart', '/exit'];
  int _lastIndex = 0;

  int get totalProductsInCart => _service.totalProducts;

  int get index => _tabIndex.value;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      _showDialog();
    } else {
      if (_lastIndex != index) {
        _lastIndex = index;
        Get.toNamed(_tabs[index], id: navigatorKey);
      }
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/menu':
        return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
        );
      case '/order/shopping_cart':
        return GetPageRoute(
          settings: settings,
          page: () => ShoppingCartPage(),
          binding: ShoppingCartBindings(),
        );
    }

    return null;
  }

  Future<void> _showDialog() async {
    await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: const Text('Sair'),
          content: const Text('Tem certeza que deseja sair do aplicativo?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                _tabIndex.value = _lastIndex;
              },
              child: const Text(
                'Cancelar',
              ),
            ),
            TextButton(
              onPressed: () => Get.find<AuthService>().logout(),
              child: const Text(
                'Sair',
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}
