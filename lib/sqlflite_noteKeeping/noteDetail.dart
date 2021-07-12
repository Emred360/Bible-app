import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/notes.dart';
import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
import 'package:testing_run/utils/database_helper.dart';

import '../colors.dart';

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
  Note note;
  TextEditingController guestMinisterController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  _NoteDetailState(Note note, String appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    topicController.text = note.topic;
    dateController.text = note.date;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "New Note",
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
                value: getPriorityAsString(note.priority),
                onChanged: (valueSelectedbyUser) {
                  setState(() {
                    print("priority:$valueSelectedbyUser");
                    updatePriorityAsInt(valueSelectedbyUser);
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
                style: TextStyle(),
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
              child: TextField(
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
              child: TextField(
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
        note.priority = 1;
        break;
      case 'Not Important':
        note.priority = 2;
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
    note.minister = guestMinisterController.text;
  }

  void updateTopic() {
    note.topic = topicController.text;
  }

  void updateDate() {
    note.date = dateController.text;
  }

  void updateScripture() {
    note.scripture = textController.text;
  }

  void updateMessage() {
    note.message = messageController.text;
  }

//SaveDataToDatabase
  void _save() async {
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
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
    if (note.id != null) {
      _showAlertDialog('Status:', 'No Note was deleted');
      return;
    }
    int result = await helper.deleteNote(note.id);
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
