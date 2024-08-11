import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/providers/comment_provider.dart';
import 'package:flutter_application_1/providers/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/post_details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    //final commentProvider = Provider.of<CommentProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: FutureBuilder(
          future: postProvider.fetchPosts(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                return Card(
                  surfaceTintColor: Colors.black12,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return PostDetailsPage(
                              postStr: postProvider.posts[index],
                              commentStr: "No Comment");
                        },
                      ));
                    },
                    title: Text(postProvider.posts[index] ?? 'No Title'),
                    subtitle: Text(postProvider.posts[index] ?? 'No BODY'),
                  ),
                );
              },
            );
          },
        ));
  }
}
