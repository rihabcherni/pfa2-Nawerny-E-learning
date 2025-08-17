import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CategoryCoursVisitorService {
  static const baseUrl = backendUrl + '/api/course';

  static Future<List<Course>> getCoursesByCategory(int categoryId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/courses/category/$categoryId/'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((courseJson) => Course.fromJson(courseJson)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
