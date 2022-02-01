import 'package:get/get.dart';
import '../modules/auth/login/login_bindings.dart';
import '../modules/auth/register/register_bindings.dart';
import '../modules/auth/register/register_page.dart';
import '../modules/auth/login/login_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
  ];
}
