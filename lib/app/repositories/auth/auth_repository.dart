import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(String name, String email, String password);
  Future<UserModel> login(String email, String password);
}
