import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing_run/http/post_model.dart';

class PostDetail extends StatefulWidget {
  // const PostDetail({Key? key}) : super(key: key);
  final Post post;

  const PostDetail({@required this.post});
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post.book"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              //Use ListView.builder
              children: [
                ListTile(
                  title: Text("{post.verseNum}"),
                  subtitle: Text("post.verse"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
