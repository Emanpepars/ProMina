import 'package:dio/dio.dart';
import 'package:pro_mina/core/api/api_keys.dart';
import 'package:pro_mina/core/utils/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (CacheHelper.getDate(ApiKeys.token) != null) {
      options.headers['Authorization'] =
          'Bearer ${CacheHelper.getDate(ApiKeys.token)}';
    }
    return super.onRequest(options, handler);
  }
}
