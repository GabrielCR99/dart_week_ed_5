import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/services/auth_service.dart';
import '../menu/menu_page.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order', '/exit'];

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      _showDialog();
    } else {
      Get.toNamed(_tabs[index], id: navigatorKey);
    }
  }

  int get index => _tabIndex.value;

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/menu':
        return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          transition: Transition.fadeIn,
        );
      default:
    }
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
                _tabIndex.value = 0;
              },
              child: const Text(
                'Cancelar',
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<AuthService>().logout();
              },
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
