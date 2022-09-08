
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/',
        headers: {
          // HttpHeaders.authorizationHeader: 'SOFIKART-*2021#',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
    String? url,
    Map<String, dynamic>? query,
  ) async {
    return await dio!.get(url!, queryParameters: query!);
  }
}
