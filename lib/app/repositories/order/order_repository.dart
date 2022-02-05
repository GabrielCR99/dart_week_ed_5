import '../../models/order.dart';
import '../../models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
