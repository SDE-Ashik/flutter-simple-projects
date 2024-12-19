import 'dart:convert';
import 'package:flutterproject/model/project_model.dart';
import 'package:http/http.dart' as http;

class ProjectService {
  final String apiUrl = 'https://api.example.com/projects';

  Future<List<dynamic>> fetchProjects() async {
    final url = Uri.parse('https://api.brandexperts.ae/api/projects/');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI5Mjc5LCJpYXQiOjE3MzQ2MzcyNzksImp0aSI6ImNjMGUwNWM0ZWM1MjRiZDJhNGUwYTUzMjY5ZjJhMTBjIiwidXNlcl9pZCI6MTZ9.VwN7TjfebbaMl4j_AsMcRH4K4FnUrL_T7CYtIpFVytA',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Check your token');
    } else {
      throw Exception(
          'Failed to load projects. Status code: ${response.statusCode}');
    }
  }
}