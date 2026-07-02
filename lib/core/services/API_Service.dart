import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../featuers/models/procucts.dart';

class ApiService {
  Future<List<Products>> fetchProducts() async {

    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {

      final jsonData = json.decode(response.body);

      List products = jsonData["products"];

      return products
          .map((item) => Products.fromJson(item))
          .toList();

    } else {
      throw Exception("Failed to load products");
    }
  }
}