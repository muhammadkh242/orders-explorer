
import 'package:orders_explorer/base/data/models/error_type.dart';

class ApiError {
  ErrorType? type;
  int? code;

  ApiError({this.type, this.code});
}
