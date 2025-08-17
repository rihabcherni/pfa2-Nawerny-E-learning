import 'package:pfa_frontend/models/category.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/utils/constants.dart';

class CategoryService {
  final String apiUrl =  backendUrl + '/api/course/category/';

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Category> categories =
          data.map((category) => Category.fromJson(category)).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
