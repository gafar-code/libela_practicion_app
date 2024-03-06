import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:libela_practition/app/core/constant/constant.dart';
import 'package:libela_practition/app/core/network/param.dart';

import 'endpoints.dart';
import 'interceptors.dart';
import 'logger.dart';
import 'upload_file_body.dart';

class DioClient {
  late final Dio _dio;

  DioClient() : _dio = Dio(_options)..interceptors.addAll(_interceptors);

  static BaseOptions get _options => BaseOptions(
        baseUrl: kBaseUrl,
        connectTimeout: Endpoints.connectTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
        validateStatus: (status) => (status ?? 0) < 500,
      );

  static List<Interceptor> get _interceptors => [
        LoggerInterceptor(Logger()),
        AuthorizationInterceptor(),
      ];

  // GET METHOD
  Future<Response> get(
    String url, {
    QueryParam? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters?.toJson(),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response> post(
    String url, {
    RequestBody? body,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: body?.toJson(),
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response> put(
    String url, {
    RequestBody? body,
    QueryParam? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: body?.toJson(),
        queryParameters: queryParameters?.toJson(),
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<Response> delete(
    String url, {
    QueryParam? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        queryParameters: queryParameters?.toJson(),
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // BULK DELETE METHOD
  Future<Response> bulkDelete(
    String url, {
    List<dynamic>? queries,
    String? queryKey,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      String query = queries!.map((e) => '$queryKey=$e').join('&');

      final Response response = await _dio.delete(
        '$url?$query',
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // UPLOAD IMAGE METHOD
  Future<Response> uploadImage({
    required String url,
    required UploadImageBody body,
  }) async {
    try {
      final images = body.image64;
      final files = List.generate(
        images.length,
        (i) => MultipartFile.fromBytes(images[i],
            filename: 'image-${body.name}-$i'),
      );

      final data = FormData.fromMap({"name": body.name, "images": files});
      final options = BaseOptions(
        baseUrl: kBaseUrl,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
        connectTimeout: Endpoints.connectTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
        validateStatus: (status) => (status ?? 0) < 500,
      );
      final dio = Dio(options)..interceptors.addAll(_interceptors);

      final Response response = await dio.post(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // UPLOAD FILE METHOD
  Future<Response> uploadFile({
    required String url,
    required UploadFileBody body,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'fileName': body.type,
        'file':
            await MultipartFile.fromFile(body.path, filename: body.fileName),
      });
      final options = BaseOptions(
        baseUrl: kBaseUrl,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'multipart/form-data',
        },
        connectTimeout: Endpoints.connectTimeout,
        receiveTimeout: Endpoints.receiveTimeout,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => (status ?? 0) < 500,
      );
      log(body.type);
      log(body.path);
      log(body.fileName);

      final dio = Dio(options)..interceptors.addAll(_interceptors);

      final Response response = await dio.post(url, data: formData);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}