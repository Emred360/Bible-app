import 'package:flutter/foundation.dart';

class Post {
  final int verseId;
  final String book;
  final int chapter;
  final String verse;
  final String body;

  Post({
    @required this.verseId,
    @required this.book,
    @required this.chapter,
    @required this.verse,
    @required this.body,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      verseId: json['verseId'] as int,
      book: json['bookName'] as String,
      chapter: json['chapterNum'] as int,
      verse: json['verse'] as String,
      body: json['body'] as String,
    );
  }
}
