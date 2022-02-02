import 'package:get/get.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()),
      )
      ..lazyPut<RegisterController>(
        () => RegisterController(authRepository: Get.find()),
      );
  }
}
