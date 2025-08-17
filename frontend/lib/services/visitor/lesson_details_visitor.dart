import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/Lecons.dart';
import 'package:pfa_frontend/utils/constants.dart';

class LessonDetailsService {
  final String apiUrl = backendUrl + '/api/course/lecons';

  Future<LessonDetails> fetchLessonDetails(int lessonId) async {
    final response = await http.get(Uri.parse('$apiUrl/$lessonId/'));

    if (response.statusCode == 200) {
      return LessonDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load lesson details');
    }
  }
}
