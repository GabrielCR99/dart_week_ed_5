import 'package:get/get.dart';
import '../../core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkIsLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
