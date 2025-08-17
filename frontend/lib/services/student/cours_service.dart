import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/utils/constants.dart';

class CourseService {
  final String apiUrl =  backendUrl + '/api/course/cours/';

  Future<List<Course>> getCourses() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
