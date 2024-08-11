import 'package:flutter/material.dart';
import 'package:flutter_application_1/repoistory/posts_repostiory.dart';

class PostProvider with ChangeNotifier {
  final PostsRepository postsRepository;
  List<String> _posts = [];

  PostProvider({required this.postsRepository});

  List<String> get posts => _posts;

  Future<void> fetchPosts() async {
    try {
      //  print('Fetching posts...'); // Print statement before the API call
      _posts = await postsRepository.getPosts();
      //    print(          'Posts fetched successfully: $_posts'); // Print statement after the API call
      notifyListeners();
    } catch (e) {
      //     print('Error fetching posts: $e'); // Print statement for error handling
    }
  }
}
