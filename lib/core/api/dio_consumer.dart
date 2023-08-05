import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:orders_system/core/api/api_consumer.dart';
import 'package:orders_system/core/errors/app_exceptions.dart';
import 'package:orders_system/core/services/injection_container.dart';

import 'api_interceptor.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    // (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..validateStatus = (status) => true;
    client.interceptors.add(injector<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(injector<LogInterceptor>());
    }
  }

  @override
  Future<(Response?, String?)> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return (response, null);
    } on DioException catch (e) {
      final error = ServerException.fromDioError(e);
      return (null, error.toString());
    } catch (e) {
      final error = ServerException(e.toString());
      return (null, error.toString());
    }
  }

  @override
  Future<(Response?, String?)> post(String path,
      {dynamic body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return (response, null);
    } on DioException catch (e) {
      final error = ServerException.fromDioError(e);
      return (null, error.toString());
    } catch (e) {
      final error = ServerException(e.toString());
      return (null, error.toString());
    }
  }

  @override
  Future<(Response?, String?)> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.put(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return (response, null);
    } on DioException catch (e) {
      final error = ServerException.fromDioError(e);
      return (null, error.toString());
    } catch (e) {
      final error = ServerException(e.toString());
      return (null, error.toString());
    }
  }

  @override
  Future<(Response?, String?)> delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return (response, null);
    } on DioException catch (e) {
      final error = ServerException.fromDioError(e);
      return (null, error.toString());
    } catch (e) {
      final error = ServerException(e.toString());
      return (null, error.toString());
    }
  }
}
