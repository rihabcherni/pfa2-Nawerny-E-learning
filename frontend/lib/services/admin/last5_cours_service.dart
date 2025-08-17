import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/admin/admin_cours_last5.dart';
import 'package:pfa_frontend/utils/constants.dart';

class Last5CoursService {
  Future<List<AdminCourseLast5>> fetchLast5Courses() async {
    final response =
        await http.get(Uri.parse(backendUrl + '/api/course/last-5-courses/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((course) => AdminCourseLast5.fromJson(course))
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
