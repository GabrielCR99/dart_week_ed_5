import 'dart:developer';

import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/messages_mixin.dart';
import '../../models/product_model.dart';
import '../../repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _repository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository repository})
      : _repository = repository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await _findAllProducts();
      _loading.toggle();
    } catch (e) {
      _loading.toggle();
      log('Erro ao buscar produtos');
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar produtos',
          type: MessageType.error,
        ),
      );
    }
  }

  Future<void> _findAllProducts() async {
    final products = await _repository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await _findAllProducts();
    } catch (e) {
      log('Erro ao buscar produtos');
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar produtos',
          type: MessageType.error,
        ),
      );
    }
  }
}

class Person {
  final String name;
  final int age;
  final double height;
  final Address address;

  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.address,
  });
}

class Address {
  String uf;
  String localidade;
  String bairro;

  Address({
    required this.uf,
    required this.localidade,
    required this.bairro,
  });
}
