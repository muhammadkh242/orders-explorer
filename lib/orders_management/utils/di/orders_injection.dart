import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/common/network/api_manager.dart';
import 'package:orders_explorer/orders_management/utils/constants/orders_constants.dart';
import '../../data/data_sources/remote_data_source.dart';
import '../../data/repository/mock_orders_repository.dart';
import '../../data/repository/network_orders_repository.dart';
import '../../domain/repository/orders_repository.dart';
import '../../domain/usecases/get_orders.dart';


final apiManagerProvider = Provider<ApiManager>(
  (ref) => ApiManager(baseUrl: OrdersConstants.ordersPath),
);

final remoteDataSourceProvider = Provider<RemoteDataSource>(
  (ref) => RemoteDataSource(ref.watch(apiManagerProvider)),
);

final networkOrdersRepositoryProvider = Provider<OrdersRepository>(
  (ref) => NetworkOrdersRepository(ref.watch(remoteDataSourceProvider)),
);

final mockOrdersRepositoryProvider = Provider<OrdersRepository>(
  (ref) => MockOrdersRepository(),
);

final getOrdersProvider = Provider<GetOrders>(
  (ref) => GetOrders(ref.watch(networkOrdersRepositoryProvider)),
);

