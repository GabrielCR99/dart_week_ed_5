import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.userKey, (value) {
      _isLogged(value != null);
    });
    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });
    _isLogged(getUserId() != null);

    return this;
  }

  void logout() => _getStorage.write(Constants.userKey, null);

  int? getUserId() => _getStorage.read(Constants.userKey);
}
