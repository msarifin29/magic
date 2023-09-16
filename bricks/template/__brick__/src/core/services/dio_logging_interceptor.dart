// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, unnecessary_null_comparison
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final SecureStorageManager _storageManager;
  DioLoggingInterceptor(
    this._dio,
    this._storageManager,
  );

  var isRefreshTokenProcessing = false;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) => client
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    debugPrint(
        '--> ${options.method.toUpperCase()} ${options.baseUrl + options.path}');
    if (options.headers.containsKey(BaseUrlConfig.requiredToken)) {
      var accessToken = await _storageManager.getToken();
      options.headers.remove(BaseUrlConfig.requiredToken);
      options.headers
          .addAll({HttpHeaders.authorizationHeader: 'Bearer $accessToken'});
    }

    if (options.extra.containsKey(BaseUrlConfig.toFormData)) {
      options.extra.remove(BaseUrlConfig.toFormData);
      options.data = FormData.fromMap(options.data);
    }
    if (options.headers.containsKey(BaseUrlConfig.download)) {
      options.headers.remove(BaseUrlConfig.download);
    }

    options.headers.addAll({HttpHeaders.acceptHeader: 'application/json'});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}');

    handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        '<-- ${err.message} ${(err.response?.requestOptions != null ? ((err.response?.requestOptions.baseUrl ?? '') + (err.response?.requestOptions.path ?? '')) : 'URL')}');

    var responseCode = err.response?.statusCode;
    debugPrint("<-- response data = ${err.response?.data}");
    debugPrint("<-- response code = $responseCode");
    if (isRefreshTokenProcessing && err.response != null) {
      await Future.delayed(const Duration(seconds: 2));
      final options = err.response!.requestOptions;
      options.headers.addAll({'requiredtoken': true});
      final response = await _dio.fetch(options);
      return handler.resolve(response);
    }
    if (responseCode == 302) {
      if (err.response != null &&
          err.response!.headers.map['location'] != null) {
        final newUrl = err.response!.headers.map['location']!.isNotEmpty
            ? err.response!.headers.map['location']!.first
            : '';
        try {
          final response = await _dio.get(
            newUrl,
            options: Options(
              headers: {
                BaseUrlConfig.requiredToken: true,
              },
            ),
          );
          return handler.resolve(response);
        } on DioError catch (error) {
          return handler.next(error);
        }
      }
    }
    return handler.next(err);
  }
}

class BaseUrlConfig {
  static const requiredToken = 'requiredToken';
  static const download = 'download';
  static const toFormData = "toFormData";
}
