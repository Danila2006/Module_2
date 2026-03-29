import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() {
    return 'ApiException: $message (code: $statusCode)';
  }
}

class PostApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'User-Agent': 'FlutterApp',
      },
    ),
  );

  Future<List<Map<String, dynamic>>> getPosts() async {
    try {
      final res = await _dio.get('/posts');
      return List<Map<String, dynamic>>.from(res.data);
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? 'Network error',
        e.response?.statusCode,
      );
    }
  }

  Future<Map<String, dynamic>> getPostById(int id) async {
    try {
      final res = await _dio.get('/posts/$id');
      return Map<String, dynamic>.from(res.data);
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? 'Error fetching post',
        e.response?.statusCode,
      );
    }
  }

  Future<Map<String, dynamic>> createPost(
      String title, String body, int userId) async {
    try {
      final res = await _dio.post('/posts', data: {
        'title': title,
        'body': body,
        'userId': userId,
      });
      return Map<String, dynamic>.from(res.data);
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? 'Error creating post',
        e.response?.statusCode,
      );
    }
  }

  Future<bool> deletePost(int id) async {
    try {
      final res = await _dio.delete('/posts/$id');
      return res.statusCode == 200;
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? 'Error deleting post',
        e.response?.statusCode,
      );
    }
  }
}