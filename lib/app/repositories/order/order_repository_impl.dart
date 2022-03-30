import 'dart:developer';

import '../../core/rest_client/rest_client.dart';
import '../../models/order_pix.dart';
import '../../models/order.dart';
import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;

  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post(
      '/order/',
      {
        'userId': order.userId,
        'cpf': order.cpf,
        'address': order.address,
        'items': order.items
            .map(
              (e) => {
                'quantity': e.amount,
                'productId': e.product.id,
              },
            )
            .toList()
      },
    );

    if (result.hasError) {
      log(
        'Erro ao realizar registro',
        stackTrace: StackTrace.current,
        error: result.statusText,
      );
      throw RestClientException(
        'Erro ao realizar pedido',
        statusCode: result.statusCode,
      );
    }

    return OrderPix.fromMap(result.body);
  }
}
