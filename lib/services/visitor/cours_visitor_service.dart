import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CoursesVisitorService {
  Future<List<Course>> fetchList() async {
    final response =
        await http.get(Uri.parse(backendUrl + '/api/course/cours-only/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((course) => Course.fromJson(course))
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
