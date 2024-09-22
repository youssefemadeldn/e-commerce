import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ApiConstant.baseUrl + endpoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> postData(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.post(
      ApiConstant.baseUrl + endpoint,
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
    );
  }
}
