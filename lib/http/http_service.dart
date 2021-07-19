// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:testing_run/http/post_model.dart';

// class HttpService {
//   final String postsUrl = "https://api.scripture.api.bible/v1/bibles";
//   Future<List<Post>> getPost() async {
//     Response res = await get(postsUrl);
//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);
//       List<Post> post =
//           body.map((dynamic item) => Post.fromJson(item)).toList();
//       return post;
//     } else {
//       throw "Can't get Post";
//     }
//   }
// }
