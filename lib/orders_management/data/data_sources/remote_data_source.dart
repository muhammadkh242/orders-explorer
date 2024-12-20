import 'package:orders_explorer/common/network/api_manager.dart';
import 'package:orders_explorer/base/data/models/api_result.dart';
import 'package:orders_explorer/orders_management/data/models/order.dart';


class RemoteDataSource {
  RemoteDataSource(this.apiManager);

  ApiManager apiManager;

  Future<ApiResult<List<Order>>> getOrders() async =>
      await apiManager.getList<Order>();
}
