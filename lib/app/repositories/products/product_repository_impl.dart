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
      throw RestClientException('Erro ao buscar produtos');
    }

    return result.body!
        .map<ProductModel>((e) => ProductModel.fromMap(e))
        .toList();
  }
}
