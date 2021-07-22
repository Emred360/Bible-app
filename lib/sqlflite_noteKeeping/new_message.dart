import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testing_run/Bible/select_book.dart';
import 'package:testing_run/components/constants.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/utils/database_helper.dart';

class NewMessage extends StatefulWidget {
  // const NewMessage({ Key? key }) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController topicController = TextEditingController();
  TextEditingController scriptureController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  TextStyle textStyle = TextStyle(
    fontSize: 15,
  );

  var value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "New Message",
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
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              title: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: Visibility(
                    visible: false,
                    child: Icon(
                      Icons.arrow_downward,
                    ),
                  ),
                  // underline: DropdownButtonHideUnderline(),
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
            ),
            //First
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
                    // updateTopic();
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
                controller: scriptureController,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Sciptures Entered");
                    // updateScripture();
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

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                ),
                child: GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectBooks()));
                  },
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    controller: messageController,
                    style: TextStyle(),
                    onChanged: (value) {
                      setState(() {
                        print("Message Entered");
                        // updateMessage();
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
            Navigator.pop(context);
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
  } //SaveDataToDatabase

  void _save() async {
    Note note = Note(
      2,
      "",
      topicController.text,
      scriptureController.text,
      messageController.text,
      DateFormat.yMMMd().format(DateTime.now()),
    );
    moveToLastScreen();
    DatabaseHelper helper = DatabaseHelper();
    int result;
    if (note != null) {
      result = await helper.insertNote(note);
      //Case 1: Update Operation
    }
    if (result != 0) {
      _showAlertDialog('status:', 'Message Saved Successfully $result');
    } else {
      _showAlertDialog('status:', 'Problem Saving Message');
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
