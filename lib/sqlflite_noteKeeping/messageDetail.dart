import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testing_run/components/constants.dart';
import 'package:testing_run/models/sqlflite_messageDB.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
import 'package:testing_run/utils/database_helper.dart';
import 'package:testing_run/utils/database_helper_message.dart';

class MessageDetail extends StatefulWidget {
  // const MessageDetail({ Key? key }) : super(key: key);
  static var _prioritiesM = [
    "Favorite",
    "Not Favorite",
  ];
  String appBarTitleM;
  MessageM messaage;
  // final Note note;

  MessageDetail(this.messaage, this.appBarTitleM);
  @override
  _MessageDetailState createState() {
    return _MessageDetailState(
      this.messaage,
      this.appBarTitleM,
    );
  }
}

class _MessageDetailState extends State<MessageDetail> {
  DatabaseHelperM helperM = DatabaseHelperM();
  _MessageDetailState(MessageM messaage, String appBarTitle);
  TextEditingController topicControllerM = TextEditingController();
  TextEditingController textControllerM = TextEditingController();
  TextEditingController messageControllerM = TextEditingController();
  TextEditingController dateControllerM = TextEditingController();
  TextStyle textStyle = TextStyle(
    fontSize: 15,
  );
  @override
  void initState() {
    super.initState();
    log("dara -- ${widget.messaage.toMap()}");

    topicControllerM = TextEditingController(text: widget.messaage.topicM);
    textControllerM = TextEditingController(text: widget.messaage.scriptureM);
    messageControllerM = TextEditingController(text: widget.messaage.messageM);
    dateControllerM = TextEditingController(text: widget.messaage.dateM);
    super.initState();
    // value = getPriorityAsString(1);
  }

  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Message",
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
            // ListTile(
            //   title: DropdownButton(
            //     items: _prioritiesM.map(
            //       (String dropDownStringItem) {
            //         return DropdownMenuItem(
            //           value: dropDownStringItem,
            //           child: Text(
            //             dropDownStringItem,
            //             style: textStyle,
            //           ),
            //         );
            //       },
            //     ).toList(),
            //     value: value,
            //     onChanged: (valueSelectedbyUser) {
            //       setState(() {
            //         value = valueSelectedbyUser;
            //       });
            //     },
            //   ),
            // ),
            //First

            //Second

            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: TextFormField(
                controller: topicControllerM,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Topic Entered");
                    updateTopicM();
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
                controller: textControllerM,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Sciptures Entered");
                    updateScriptureM();
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
                controller: messageControllerM,
                style: TextStyle(),
                onChanged: (value) {
                  setState(() {
                    print("Message Entered");
                    updateMessageM();
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
                  _saveM();
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
        widget.messaage.priorityM = 1;
        break;
      case 'Not Important':
        widget.messaage.priorityM = 2;
        break;
    }
  }

  // String getPriorityAsString(int value) {
  //   String priority;
  //   switch (value) {
  //     case 1:
  //       priority = _priorities[0];
  //       break;
  //     case 2:
  //       priority = _priorities[1];
  //       break;
  //   }
  //   return priority;
  // }

  void updateTopicM() {
    widget.messaage.topicM = topicControllerM.text;
  }

  void updateDateM() {
    widget.messaage.dateM = dateControllerM.text;
  }

  void updateScriptureM() {
    widget.messaage.scriptureM = textControllerM.text;
  }

  void updateMessageM() {
    widget.messaage.messageM = messageControllerM.text;
  }

//SaveDataToDatabase
  void _saveM() async {
    widget.messaage.dateM = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (widget.messaage.idM != null) {
      result = await helperM.updateMessageM(widget.messaage);
      //Case 1: Update Operation
    } else {
      //Case 2:   Operation
    }
    log('ehat is going on guys?');
    moveToLastScreen(data: result != 0);
   
  }

  void _deleteM() async {
    moveToLastScreen();
    if (widget.messaage.idM != null) {
      _showAlertDialogM('Status:', 'No Message was deleted');
      return;
    }
    int result = await helperM.deleteMessageM(widget.messaage.idM);
    if (result != 0) {
      _showAlertDialogM('status:', 'Note Deleted Successfully');
    } else {
      _showAlertDialogM('status:', 'Error Occured while deleting Note');
    }
  }

  void _showAlertDialogM(String topicM, String dateM) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(topicM),
      content: Text(dateM),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void moveToLastScreen({bool data = true}) {
    Navigator.pop(context, data);
  }
}
