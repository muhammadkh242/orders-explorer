import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orders_explorer/common/network/api_return_handler.dart';

import '../../base/data/models/api_result.dart';

class ApiManager extends ApiReturnHandler {
  ApiManager({required this.baseUrl});
  String baseUrl;
  Future<ApiResult<List<T>>> getList<T>() async {
    try {
      final String response = await rootBundle.loadString(baseUrl);
      final jsonData = json.decode(response);
      debugPrint("jsonData $jsonData");
      return handleListResponse(jsonData);
    } catch (error) {
      debugPrint("error $error");
      return handleErrorResponse(error);
    }
  }
}
