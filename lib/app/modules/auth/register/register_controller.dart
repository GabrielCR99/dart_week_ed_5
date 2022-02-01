import 'dart:developer';

import 'package:get/get.dart';
import '../../../core/rest_client/rest_client.dart';
import '../../../core/mixins/messages_mixin.dart';
import '../../../core/mixins/loader_mixin.dart';
import '../../../repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.register(name, email, password);
      _loading.toggle();
      //TODO: Voltar quando fizer login
      Get.back();
      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Cadastro realizado com sucesso',
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e) {
      _loading.toggle();
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário',
          type: MessageType.error,
        ),
      );
    }
  }
}
