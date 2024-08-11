import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/comment_model.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/providers/comment_provider.dart';
import 'package:flutter_application_1/providers/post_provider.dart';
import 'package:provider/provider.dart';

class PostDetailsPage extends StatefulWidget {
  final String postStr;
  final String commentStr;
  const PostDetailsPage(
      {required this.postStr, required this.commentStr, super.key});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.postStr),
        ),
        body: FutureBuilder(
          future: commentProvider.fetchComments(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: commentProvider.comments.length,
              itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.black12,
                  child: ListTile(
                    subtitle:
                        Text(commentProvider.comments[index] ?? 'No BODY'),
                  ),
                );
              },
            );
          },
        ));
  }
}
