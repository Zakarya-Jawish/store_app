import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<dynamic> addProduct({
    required dynamic title,
    required dynamic price,
    required dynamic description,
    required dynamic image,
    required dynamic category,
  }) async {
    Map<String, dynamic> newProduct = await Api().post(
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
    );
    return newProduct;
  }
}
