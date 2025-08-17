import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/utils/constants.dart';

import '../../models/Lecons.dart';

class LessonService {
  Future<List<LessonOnly>> fetchLessons(int courseId) async {
    print("course Id" + courseId.toString());
    print("url" + '$backendUrl/api/course/courses/$courseId/lessons/');
    final response = await http
        .get(Uri.parse('$backendUrl/api/course/courses/$courseId/lessons/'));
    print(response);
    if (response.statusCode == 200) {
      final List<dynamic> jsonLessons = jsonDecode(response.body);
      return jsonLessons.map((json) => LessonOnly.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}
