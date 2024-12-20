import '../../../base/data/models/api_result.dart';
import '../../data/models/order.dart';

abstract class OrdersRepository {

  Future<ApiResult<List<Order>>> getOrders();
}
