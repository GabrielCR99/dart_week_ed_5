import 'package:get/get.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';
import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()),
      )
      ..lazyPut<LoginController>(
        () => LoginController(authRepository: Get.find()),
      );
  }
}
