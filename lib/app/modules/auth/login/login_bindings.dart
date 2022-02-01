import 'package:get/get.dart';
import 'login_controller.dart';
import '../../../repositories/auth/auth_repository.dart';
import '../../../repositories/auth/auth_repository_impl.dart';

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
