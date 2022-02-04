import 'package:get/get.dart';
import '../../core/services/shopping_cart_service.dart';
import '../../models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _amount = 0.obs;
  final ShoppingCartService _service;
  final _hasAdded = false.obs;

  ProductDetailController({required ShoppingCartService service})
      : _service = service;

  ProductModel get product => _product.value;
  double get totalPrice => _amount.value == 0 ? 0.0 : _totalPrice.value;
  int get amount => _amount.value;
  bool get hasAdded => _hasAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_amount, (amount) {
      _totalPrice(product.price * amount);
    });
    final addedProduct = _service.getById(product.id);
    if (addedProduct != null) {
      _amount(addedProduct.amount);
      _hasAdded(true);
    }
  }

  void addProduct() {
    _amount.value++;
  }

  void removeProduct() {
    if (amount > 0) {
      _amount.value--;
    }
  }

  void addProductToCart() {
    _service.addAndRemoveProductInShoppingCart(product, amount: amount);
    Get.back();
  }
}
