import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/notes.dart';
import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
import 'package:testing_run/utils/database_helper.dart';

import 'package:testing_run/components/constants.dart';

class NoteDetail extends StatefulWidget {
  final Note note;
  String appBarTitle;
  NoteDetail(this.note, this.appBarTitle);
  @override
  _NoteDetailState createState() {
    return _NoteDetailState(
      this.note,
      this.appBarTitle,
    );
  }
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;

  TextEditingController guestMinisterController;
  TextEditingController topicController;
  TextEditingController textController;
  TextEditingController messageController;
  TextEditingController dateController;
  TextStyle textStyle = TextStyle(
    fontSize: 15,
  );

  _NoteDetailState(Note note, String appBarTitle);
  @override
  void initState() {
    super.initState();
    log("dara -- ${widget.note.toMap()}");
    guestMinisterController = TextEditingController(text: widget.note.minister);
    topicController = TextEditingController(text: widget.note.topic);
    textController = TextEditingController(text: widget.note.scripture);
    messageController = TextEditingController(text: widget.note.message);
    dateController = TextEditingController(text: widget.note.date);
    super.initState();
    value = getPriorityAsString(1);
  }

  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Note",
        ),
        backgroundColor: kprimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.0,
          left: 10.0,
          right: 10.0,
        ),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map(
                  (String dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: textStyle,
                      ),
                    );
                  },
                ).toList(),
                value: value,
                onChanged: (valueSelectedbyUser) {
                  setState(() {
                    value = valueSelectedbyUser;
                  });
                },
              ),
            ),
            //First

            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                controller: guestMinisterController,
                style: textStyle,
                onChanged: (value) {
                  setState(() {
                    print("Message Entered");
                    updateMinister();
                  });
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Minister",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //Second

            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextFormField(
                controller: topicController,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Topic Entered");
                    updateTopic();
                  });
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Topic",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //Third

            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextField(
                textInputAction: TextInputAction.go,
                controller: textController,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Sciptures Entered");
                    updateScripture();
                  });
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Sciptures",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            //Fourth

            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.go,
                controller: messageController,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Message Entered");
                    updateMessage();
                  });
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: "Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        child: Icon(
          Icons.close,
        ),
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteeList(),
              ),
            );
            print("Delete");
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: SvgPicture.asset("assets/svg/menu.svg"),
                  color: kprimaryColor,
                  onPressed: () {
                    print("row 1 preessed");
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.save_sharp,
                color: kprimaryColor,
              ),
              onPressed: () {
                setState(() {
                  print("Save");
                  _save();
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: kprimaryColor,
              ),
              onPressed: () {
                print("row 1 presssed");
              },
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'Important':
        widget.note.priority = 1;
        break;
      case 'Not Important':
        widget.note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  void updateMinister() {
    widget.note.minister = guestMinisterController.text;
  }

  void updateTopic() {
    widget.note.topic = topicController.text;
  }

  void updateDate() {
    widget.note.date = dateController.text;
  }

  void updateScripture() {
    widget.note.scripture = textController.text;
  }

  void updateMessage() {
    widget.note.message = messageController.text;
  }

//SaveDataToDatabase
  void _save() async {
    moveToLastScreen();
    widget.note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (widget.note.id != null) {
      result = await helper.updateNote(widget.note);
      //Case 1: Update Operation
    } else {
      //Case 2:   Operation
    }
    if (result != 0) {
      _showAlertDialog('status:', 'Note Saved Successfully');
    } else {
      _showAlertDialog('status:', 'Problem Saving Note');
    }
  }

  void _delete() async {
    moveToLastScreen();
    if (widget.note.id != null) {
      _showAlertDialog('Status:', 'No Note was deleted');
      return;
    }
    int result = await helper.deleteNote(widget.note.id);
    if (result != 0) {
      _showAlertDialog('status:', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('status:', 'Error Occured while deleting Note');
    }
  }

  void _showAlertDialog(String topic, String date) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(topic),
      content: Text(date),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
