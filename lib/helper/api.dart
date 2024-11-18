import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();
  Api() {
    dio.options.baseUrl = "https://fakestoreapi.com/";
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }
  Future<dynamic> get({required String url, String? token}) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        dio.options.headers.addAll({'Authorization': token});
      }
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            "Wrong Status Code when try to get: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> post({required dynamic body, String? token}) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      if (token != null) {
        dio.options.headers.addAll({'Authorization': token});
      }

      Response response = await dio.post(
        'products',
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            "Wrong Status Code when try to post: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> put({
    required dynamic body,
    String? token,
    required String id,
  }) async {
    try {
      dio.options.headers = {
        'Content-Type': 'application/json',
      };
      if (token != null) {
        dio.options.headers.addAll({'Authorization': token});
      }
      Response response = await dio.put(
        'products/$id',
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            "Wrong Status Code when try to update: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
