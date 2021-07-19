// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:testing_run/http/http_service.dart';
// import 'package:testing_run/http/post_detail.dart';
// import 'package:testing_run/http/post_model.dart';

// class PostPage extends StatefulWidget {
//   @override
//   _PostPageState createState() => _PostPageState();
// }

// class _PostPageState extends State<PostPage> {
//   final HttpService httpService = HttpService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Bible",
//         ),
//       ),
//       body: SafeArea(
//         child: FutureBuilder(
//           future: httpService.getPost(),
//           builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
//             if (snapshot.hasData) {
//               List<Post> posts = snapshot.data;
//               return ListView(
//                 children: posts
//                     .map(
//                       (Post post) => ListTile(
//                         title: Text(post.verseId.toString()),
//                         subtitle: Text(post.verse),
//                         onTap: () => Navigator.of(context).push(
//                             MaterialPageRoute(
//                                 builder: (context) => PostDetail(post: post))),
//                       ),
//                     )
//                     .toList(),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
