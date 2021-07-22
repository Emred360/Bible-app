import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  // const NewMessage({ Key? key }) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController topicController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  TextStyle textStyle = TextStyle(
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("TESTING"));
  }
}
