import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_project/core/constants/api_constant.dart';

class DioProvider {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
      ),
    );
  }

  static Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await dio.post(endpoint,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ));
    } on DioException catch (e) {
      if (e.response != null) {
        log('Error! Status Code: ${e.response?.statusCode}');
        log('Response Data: ${e.response?.data}');
      } else {
        log('Request Error: ${e.message}');
      }
      rethrow; // Re-throw the error if needed
    }
  }

  static Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> put({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.put(endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
  }
}
