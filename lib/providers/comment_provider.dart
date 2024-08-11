import 'package:flutter/material.dart';
import 'package:flutter_application_1/repoistory/comments_repostiory.dart';

class CommentProvider with ChangeNotifier {
  final CommentsRepository commentsRepository;
  List<String> _comments = [];

  CommentProvider({required this.commentsRepository});

  List<String> get comments => _comments;

  Future<void> fetchComments() async {
    _comments = await commentsRepository.getComments();
    notifyListeners();
  }
}
