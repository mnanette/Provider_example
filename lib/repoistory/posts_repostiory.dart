import 'package:dio/dio.dart';

class PostsRepository {
  final Dio dio;

  PostsRepository({required this.dio});

  Future<List<String>> getPosts() async {
    // Implement your API call here
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');

    // print((response.data as List).map((post) => post.toString()).toList());
    return (response.data as List).map((post) => post.toString()).toList();
  }
}
