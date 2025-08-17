import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CourseDetailsVisitorService {
  final String baseUrl = backendUrl + '/api/course/cours-only';

  Future<Course> fetchCourseById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/'));
    print('$baseUrl/$id/');
    print(response);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      Course course = Course.fromJson(responseData);
      return course;
    } else {
      throw Exception('Failed to load course');
    }
  }
}
