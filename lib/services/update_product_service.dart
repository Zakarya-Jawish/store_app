import '../helper/api.dart';

class UpdateProductService {
  Future<dynamic> updateProduct({
    required dynamic id,
    required dynamic title,
    required dynamic price,
    required dynamic description,
    required dynamic image,
    required dynamic category,
  }) async {
    Map<String, dynamic>? newProduct = await Api().put(
      body: {
        'id': id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
      },
      id: id,
    );
    return newProduct;
  }
}
