
import 'package:orders_explorer/base/data/models/api_error.dart';

class ApiResult<T> {
  T? data;
  ApiError? error;

  ApiResult({this.data, this.error});
}
