import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pfa_frontend/models/teacher/cours.dart';
import 'package:pfa_frontend/utils/constants.dart';

Future<List<Cours>> fetchCours() async {
  try {
final response = await http.get(Uri.parse( backendUrl + '/api/course/cours/'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      if (list != null && list.isNotEmpty) {
        return List<Cours>.from(list.map((model) => Cours.fromJson(model)));
      } else {
        return []; 
      }
    } else {
      throw Exception('Failed to load Cours: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching cours: $error');
    throw error;
  }
}
