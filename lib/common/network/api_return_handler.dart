import 'package:flutter/material.dart';
import '../../base/data/models/api_error.dart';
import '../../base/data/models/api_result.dart';
import '../../base/data/models/error_type.dart';
import '../../orders_management/data/models/order.dart';

abstract class ApiReturnHandler {
  final Map<Type, Function> _factories = {
    Order: (json) => Order.fromJson(json),
  };

  ApiResult<List<T>> handleListResponse<T>(List<dynamic> jsonArray) {
    return ApiResult<List<T>>(
      data: _convertJsonArray(jsonArray),
    );
  }

  ApiResult<T> handleErrorResponse<T>(dynamic error) {
    if (error is FlutterError &&
        error.toString().contains('Unable to load asset')) {
      return ApiResult(
        error: ApiError(
          type: ErrorType.fileNotFound,
        ),
      );
    } else if (error is FormatException) {
      return ApiResult(
        error: ApiError(
          type: ErrorType.invalidJson,
        ),
      );
    } else {
      return ApiResult(
        error: ApiError(
          type: ErrorType.unknown,
        ),
      );
    }
  }

  List<T> _convertJsonArray<T>(List<dynamic> jsonArray) {
    return jsonArray.map((e) => _fromJson<T>(e)).toList();
  }

  T _fromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    if (factory != null) {
      return factory(json) as T;
    }
    throw Exception("Unknown model type: $T");
  }
}
