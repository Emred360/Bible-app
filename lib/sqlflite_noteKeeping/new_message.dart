import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:testing_run/Bible/select_book.dart';
import 'package:testing_run/all_messages.dart';
import 'package:testing_run/components/constants.dart';
import 'package:testing_run/models/sqlflite_messageDB.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:testing_run/utils/database_helper.dart';
import 'package:testing_run/utils/database_helper_message.dart';

class NewMessage extends StatefulWidget {
  // const NewMessage({ Key? key }) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController topicControllerM = TextEditingController();
  TextEditingController scriptureControllerM = TextEditingController();
  TextEditingController messageControllerM = TextEditingController();
  TextEditingController dateControllerM = TextEditingController();
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
                controller: topicControllerM,
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
                controller: scriptureControllerM,
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
                    controller: messageControllerM,
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
  } //SaveDataToDatabase

  void _saveM() async {
    MessageM messageM = MessageM(
      2,
      topicControllerM.text,
      scriptureControllerM.text,
      messageControllerM.text,
      DateFormat.yMMMd().format(DateTime.now()),
    );
    moveToLastScreen();
    DatabaseHelperM helperM = DatabaseHelperM();
    int resultM;
    if (messageM != null) {
      resultM = await helperM.insertMessageM(messageM);
      //Case 1: Update Operation
    }
    if (resultM != 0) {
      _showAlertDialog('status:', 'Message Saved Successfully $resultM');
    } else {
      _showAlertDialog('status:', 'Problem Saving Message');
    }
  }

  void _showAlertDialog(String topicM, String dateM) {
    AlertDialog alertDialogM = AlertDialog(
      title: Text(topicM),
      content: Text(dateM),
    );
    showDialog(context: context, builder: (_) => alertDialogM);
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}
