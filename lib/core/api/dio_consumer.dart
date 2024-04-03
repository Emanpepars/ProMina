import 'package:dio/dio.dart';
import 'package:pro_mina/core/api/api_consumer.dart';
import 'package:pro_mina/core/api/api_interceptors.dart';
import 'package:pro_mina/core/utils/app_const.dart';

class DioConsumer extends ApiConsumer {
  Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = AppConst.baseApiUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: false,
        responseHeader: true,
        responseBody: false,
        error: true,
      ),
    );
  }

  @override
  Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = false,
  }) async {
    try {
      var response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = false}) async {
    try {
      var response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw 'Connection to the server timed out.';

    case DioExceptionType.sendTimeout:
      throw 'Send timed out';

    case DioExceptionType.receiveTimeout:
      throw 'Receive timed out';

    case DioExceptionType.badCertificate:
      throw 'Bad Certificate';

    case DioExceptionType.cancel:
      throw 'Request cancelled.';

    case DioExceptionType.connectionError:
      throw 'Unable to connect to the server, please make sure you are connected to the internet and try again.';

    case DioExceptionType.unknown:
      throw 'An unknown error occurred.';
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw e.response?.data['error_message'] ?? 'Bad request.';
        case 401:
          throw 'Unauthorized.';
        case 403:
          throw 'Forbidden.';
        case 404:
          throw 'Not found.';
        case 409:
          throw e.response?.data['error_message'] ?? 'Conflict.';
        case 422:
          throw 'Unprocessable entity.';
        case 504:
          throw 'Gateway timeout.';
        default:
          throw 'Server Error with status code ${e.response!.statusCode}.';
      }
  }
}
