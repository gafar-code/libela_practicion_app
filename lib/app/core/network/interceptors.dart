import 'dart:developer';

import 'package:dio/dio.dart';
import '../constant/constant.dart';
import '../utils/app_storage/app_storage.dart';
import 'logger.dart';

class LoggerInterceptor extends Interceptor {
  final Logger logger;
  Dio _dio = Dio();

  LoggerInterceptor(this.logger);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath');
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}');

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} headers ==> ${options.headers}'); //Info log
    logger.i('${options.method} request ==> $requestPath'); //Info log
    logger.i('${options.method} data ==> ${options.data}'); //Info log
    logger
        .i('${options.method} query ==> ${options.queryParameters}'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logger.d('STATUS_CODE: ${response.statusCode} \n '
        'STATUS_MESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    if (response.statusCode == 401) {
      final auth = await AppStorage().getAuthData();
      var refreshToken = auth?.refreshToken;
      if (refreshToken != null) {
        try {
          var response = await _dio.post(
            '${kBaseUrl}auths/practitioner/verify/refresh-token',
            data: {'refreshToken': refreshToken},
          );
          var newToken = response.data['data']['token'];
          var newRefreshToken = response.data['data']['refreshToken'];
          if (newToken != null) {
            await AppStorage().updateAuthToken(
                token: newToken, refreshToken: newRefreshToken);
            RequestOptions requestOptions = response.requestOptions;
            requestOptions.headers['Authorization'] = 'Bearer $newToken';
            return handler.resolve(await _dio.fetch(requestOptions));
          }
        } catch (refreshError) {
          print("Failed to refresh token: $refreshError");
        }
      }
    }
    handler.next(response); // continue with the Response
  }
}

/// This interceptor intercepts GET request and add "Authorization" header
/// and then, send it to the [API]
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final auth = await AppStorage().getAuthToken();
    var token = auth?.token;
    log(token ?? '');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options); // continue with the request
  }
}

// "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJJZCI6IjYzOTZiNGM0LWY2ZmQtNDY5YS05ODZlLTQ0OTAwNzk5ODFhOCIsImVtYWlsIjoiYWxpLmltcm9uYXNodGVyQGdtYWlsLmNvbSIsImZpcnN0TmFtZSI6IkFsaSIsImxhc3ROYW1lIjoiSW1yb24ifSwiaWF0IjoxNzA5MjYwNzQ2LCJleHAiOjE3MDk1MTk5NDZ9.DkIxLsxUNKRz_PeIiKQWVQ6x6vni5euKkO1PtwAjZZk"
