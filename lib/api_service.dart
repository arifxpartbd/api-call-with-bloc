import 'package:dio/dio.dart';

class ApiCall {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getPost() async {
    final response =
        await _dio.get("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      throw Exception('No data found');
    }
  }

  Future<List<Map<String, dynamic>>> getUser() async {
    final response =
        await _dio.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      throw Exception("No User Data Found");
    }
  }

  Future<List<Map<String, dynamic>>> getTask() async {
    final response =
        await _dio.get("https://jsonplaceholder.typicode.com/todos");

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      throw Exception('No Task Fund');
    }
  }
}
