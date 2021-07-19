import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testing_run/colors.dart';

class NewNote extends StatefulWidget {
  // const NewNote({ Key? key }) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  TextEditingController guestMinisterController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 15,
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
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
                    value: getPriorityAsString(2),
                    onChanged: (valueSelectedbyUser) {
                      setState(() {
                        print("priority:$valueSelectedbyUser");
                        // updatePriorityAsInt(valueSelectedbyUser);
                      });
                    },
                  ),
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
                      // updateMinister();
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
                  controller: textController,
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

              Padding(
                padding: EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                ),
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
                    // _save();
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
      ),
    );
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

//SaveDataToDatabase
  // void _save() async {
  //   moveToLastScreen();
  //   note.date = DateFormat.yMMMd().format(DateTime.now());
  //   int result;
  //   if (note.id != null) {
  //     result = await helper.updateNote(note);
  //     //Case 1: Update Operation
  //   } else {
  //     //Case 2:   Operation
  //   }
  //   if (result != 0) {
  //     _showAlertDialog('status:', 'Note Saved Successfully');
  //   } else {
  //     _showAlertDialog('status:', 'Problem Saving Note');
  //   }
  // }

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
