import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/admin/barchart_cours_count.dart';
import 'package:pfa_frontend/utils/constants.dart';

class BarchartCoursCountService {
  Future<BarchartCoursCount> fetchbarchartCoursCount() async {
    final response = await http
        .get(Uri.parse( backendUrl + '/api/dash/course-barchart/'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return BarchartCoursCount.fromJson(jsonData);
    } else {
      throw Exception('Failed to load course data');
    }
  }
}
