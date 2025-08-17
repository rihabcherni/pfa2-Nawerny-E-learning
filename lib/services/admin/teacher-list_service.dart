import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/admin/teacherList.dart';
import 'package:pfa_frontend/utils/constants.dart';

class TeacherListService {
  Future<List<Teacher>> fetchList() async {
    final response = await http
        .get(Uri.parse( backendUrl + '/api/auth/auteur-list/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((course) => Teacher.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<bool> deleteTeacher(int userId) async {
    final response = await http
        .delete(Uri.parse( backendUrl + '/api/auth/user/$userId/'));

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
