import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<Post> getPost() async {
  final response = await http.get('$url/1');
  return postFromJson(response.body);
}
