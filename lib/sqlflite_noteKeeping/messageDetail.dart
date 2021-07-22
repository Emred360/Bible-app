import 'package:flutter/material.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/utils/database_helper.dart';

class MessageDetail extends StatefulWidget {
  // const MessageDetail({ Key? key }) : super(key: key);
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Note note;

  TextEditingController topicController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextStyle textStyle = TextStyle(
    fontSize: 15,
  );
  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
