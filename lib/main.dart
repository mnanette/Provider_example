import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/providers/call_provider.dart';
import 'package:flutter_application_1/providers/comment_provider.dart';
import 'package:flutter_application_1/providers/post_provider.dart';
import 'package:flutter_application_1/repoistory/call_repository.dart';
import 'package:flutter_application_1/repoistory/comments_repostiory.dart';
import 'package:flutter_application_1/repoistory/posts_repostiory.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/services/dio_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(
            postsRepository: PostsRepository(dio: dioService.dio),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(
            commentsRepository: CommentsRepository(dio: dioService.dio),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CallProvider(
            callRepository: CallRepository(dio: dioService.dio),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
