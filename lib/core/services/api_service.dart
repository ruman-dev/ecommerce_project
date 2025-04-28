import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
