import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pfa_frontend/models/admin/adminCount.dart';
import 'package:pfa_frontend/utils/constants.dart';

class AdminDashCountService {
  final String baseUrl =  backendUrl + '/api/dash/dash-count/';

  Future<AdminCount> fetchDashCount() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return AdminCount.fromJson(data);
    } else {
      throw Exception('Failed to load dash count');
    }
  }
}
