import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/utils/constants.dart';

import '../../models/admin/studentList.dart';

class StudentListService {
  Future<List<Apprenant>> fetchList() async {
    final response =
        await http.get(Uri.parse(backendUrl + '/api/auth/apprenant-list/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((course) => Apprenant.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<bool> deleteApprenant(int userId) async {
    final response =
        await http.delete(Uri.parse(backendUrl + '/api/auth/user/$userId/'));

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }
}
