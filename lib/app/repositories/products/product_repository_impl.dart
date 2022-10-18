import '../../core/rest_client/rest_client.dart';
import '../../models/product_model.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get<List>('/products/');

    if (result.hasError) {
      throw const RestClientException('Erro ao buscar produtos');
    }

    return result.body!
        .cast<Map<String, dynamic>>()
        .map<ProductModel>(ProductModel.fromMap)
        .toList();
  }
}
