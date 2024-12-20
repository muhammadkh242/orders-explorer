
import '../../../base/data/models/api_result.dart';
import '../../domain/repository/orders_repository.dart';
import '../models/order.dart';

class MockOrdersRepository implements OrdersRepository {
  @override
  Future<ApiResult<List<Order>>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
}
