import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/utils/constants.dart';
import '../../models/category.dart';

class CategoryService {
  final String baseUrl = backendUrl + '/api/course/category/';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((category) => Category.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<Category> createCategory(Category category) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(category.toJson()),
    );

    if (response.statusCode == 201) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create category');
    }
  }

  Future<Category> updateCategory(Category category) async {
    final response = await http.put(
      Uri.parse('$baseUrl${category.id}/'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return Category.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update category');
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$categoryId/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete category');
    }
  }
}
