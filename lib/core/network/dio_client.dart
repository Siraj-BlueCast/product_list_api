import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_product_list/core/consts/api_const.dart';
import 'package:flutter_product_list/core/network/dio_state.dart';

class DioClient {
  Dio dio;

  DioClient(this.dio) {
    dio
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 2000)
    ..options.receiveTimeout = const Duration(milliseconds: 2000)
    ..httpClientAdapter
    ..options.headers = {'content-type': 'application/json; charset=UTF-8'};

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        responseBody: false
      ));
    }
  }

  Future<DioState> get(
    String uri,{
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
    }
  ) async {
    try {
      var response = await dio.get(
        baseUrl+uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return DioSuccess(response.data);

    } on SocketException catch (e) {
      return DioFailed(e.toString());
    }on FormatException catch (_) {
      return DioFailed("unable to process the data");
    }
     catch (e) {
      return DioFailed(e.toString());
    }
  }
}