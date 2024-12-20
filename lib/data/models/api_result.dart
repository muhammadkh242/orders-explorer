import 'package:orders_explorer/data/models/api_error.dart';

class BaseApiResult<T> {
  T? data;
  ApiError? error;

  BaseApiResult({this.data, this.error});
}
