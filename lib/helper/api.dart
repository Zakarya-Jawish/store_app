import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get({required String url}) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Wrong Status Code: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
