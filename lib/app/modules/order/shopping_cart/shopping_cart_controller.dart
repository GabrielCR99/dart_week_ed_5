import 'package:get/get.dart';

import '../../../core/mixins/loader_mixin.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/shopping_cart_service.dart';
import '../../../models/order.dart';
import '../../../models/shopping_cart_model.dart';
import '../../../repositories/order/order_repository.dart';
import '../../home/home_controller.dart';

class ShoppingCartController extends GetxController with LoaderMixin {
  final AuthService _authService;
  final ShoppingCartService _shoppingCartService;
  final OrderRepository _repository;
  final _loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  ShoppingCartController({
    required AuthService authService,
    required ShoppingCartService shoppingCartService,
    required OrderRepository repository,
  })  : _authService = authService,
        _shoppingCartService = shoppingCartService,
        _repository = repository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  double get totalValue => _shoppingCartService.totalValue;

  List<ShoppingCartModel> get products => _shoppingCartService.products;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addAmountInProduct(ShoppingCartModel model) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
      model.product,
      amount: model.amount + 1,
    );
  }

  void removeAmountInProduct(ShoppingCartModel model) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
      model.product,
      amount: model.amount - 1,
    );
  }

  void clear() => _shoppingCartService.clear();

  Future<void> createOrder() async {
    _loading.toggle();
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );
    var result = await _repository.createOrder(order);
    result.copyWith(totalValue: totalValue);
    clear();
    _loading.toggle();
    Get
      ..offNamed('/orders/finished', arguments: result)
      ..back(id: HomeController.navigatorKey);
  }
}