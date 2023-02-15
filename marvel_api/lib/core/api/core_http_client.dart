import 'dart:convert';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../environment_config.dart';
import '../error/exceptions.dart';

abstract class IHttpClient {
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
  });

  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
  });
}

class CoreHttpClient implements IHttpClient {
  Dio get dio => Dio(baseOptions);

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, String>? headers,
  }) async {
    final Dio dioInternal = _parseDio(dio, headers);
    dioInternal.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    return await _requestHandler(
      request: () => dioInternal.get(path, queryParameters: queryParameters),
      requestLabel: ':::GET:::',
    );
  }

  @override
  Future<Response> post(
    String path, {
    dynamic data = const {},
    Map<String, dynamic> queryParameters = const {},
    Map<String, String>? headers,
  }) async {
    final Dio dioInternal = _parseDio(dio, headers);
    dioInternal.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    return await _requestHandler(
      request: () => dioInternal.post(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
      requestLabel: ':::POST:::',
    );
  }

  @mustCallSuper
  BaseOptions get baseOptions => BaseOptions(
        responseDecoder: (response, _, responseBody) => responseBody.statusCode! >= 400 ? '' : utf8.decode(response),
        validateStatus: (statusCode) => statusCode! < 600,
        receiveTimeout: 5000,
        sendTimeout: 3000,
        baseUrl: EnvironmentConfig.baseUrl,
      );

  Dio _parseDio(
    Dio dio,
    Map<String, String>? headers,
  ) {
    final Dio dioInternal = dio;
    if (headers != null) dioInternal.options.headers = headers;
    return dioInternal;
  }

  Future<Response> _requestHandler({
    required RequestCallback request,
    required String requestLabel,
  }) async {
    try {
      final result = await request();
      return result;
    } on DioError catch (exception) {
      debugPrint(requestLabel);
      debugPrint(exception.message);
    }
    throw RequestException(StackTrace.current, requestLabel, '');
  }
}

typedef RequestCallback = Future<Response> Function();
