import '../../../base/data/models/api_result.dart';
import '../../domain/repository/orders_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/order.dart';

class NetworkOrdersRepository implements OrdersRepository {
  NetworkOrdersRepository(this.remoteDataSource);

  RemoteDataSource remoteDataSource;

  @override
  Future<ApiResult<List<Order>>> getOrders() {
    return remoteDataSource.getOrders();
  }
}
