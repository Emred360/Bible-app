import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';

import '../colors.dart';

class NoteDetail extends StatefulWidget {
  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static var _priorities = [
    "Favorite",
    "Not Favorite",
  ];
  TextEditingController guestMinisterController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
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
                value: _priorities[0],
                onChanged: (valueSelectedbyUser) {
                  setState(() {
                    print("priority:$valueSelectedbyUser");
                    _priorities = valueSelectedbyUser;
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
                  print("Delete");
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
}
