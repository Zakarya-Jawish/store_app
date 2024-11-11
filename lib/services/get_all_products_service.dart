import 'package:store_app/models/product_model.dart';
import 'package:dio/dio.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    Dio dio = Dio();
    Response response = await dio.get('https://fakestoreapi.com/products');
    for (var product in response.data) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }
}
