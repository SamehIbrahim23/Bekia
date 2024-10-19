import 'package:dio/dio.dart';
import '../../models/product_model.dart';

class ProductServices {
  Dio dio = Dio();
  Future<List<Product>> fetchProducts(
      {required String path, Map<String, dynamic>? query}) async {
    Response response = await dio.get(path, queryParameters: query);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = response.data;
      List jsonResponse = jsonData["products"];
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List> fetchCategoryList({required String path}) async {
    Response response = await dio.get(
      path,
    );
    if (response.statusCode == 200) {
      List catigories = response.data;
      return catigories;
    } else {
      throw Exception('Failed to load catigories');
    }
  }
}
