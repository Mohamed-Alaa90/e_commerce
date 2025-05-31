import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // مثال: إضافة توكن لو موجود (ممكن تجيبه من SharedPreferences)
    const token = 'your_token_here';

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    });

    handler.next(options);
  }
}
