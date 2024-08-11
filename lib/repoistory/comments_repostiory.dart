import 'package:dio/dio.dart';

class CommentsRepository {
  final Dio dio;

  CommentsRepository({required this.dio});

  Future<List<String>> getComments() async {
    // Implement your API call here
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/1/comments');
    return (response.data as List)
        .map((comment) => comment.toString())
        .toList();
  }
}
