
import '../../../base/data/models/api_result.dart';
import '../../data/models/order.dart';
import '../repository/orders_repository.dart';

class GetOrders {
  GetOrders(this.ordersRepository);

  OrdersRepository ordersRepository;

  Future<ApiResult<List<Order>>> call() {
    return ordersRepository.getOrders();
  }
}
