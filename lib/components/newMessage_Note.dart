import 'package:flutter/material.dart';
import 'package:testing_run/colors.dart';
import 'package:testing_run/new_message.dart';
import 'package:testing_run/notes.dart';

import '../main.dart';
import '../new_note.dart';

class NewMessageNote extends StatefulWidget {
  @override
  _NewMessageNoteState createState() => _NewMessageNoteState();
}

class _NewMessageNoteState extends State<NewMessageNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: kprimaryColor,
        child: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllNotes(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                color: kprimaryColor,
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .02,
                left: MediaQuery.of(context).size.width * .13,
                right: MediaQuery.of(context).size.width * .13,
                bottom: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewMessage(),
                    ),
                  );
                },
                child: Text(
                  "New Message",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(width: .5),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                color: kprimaryColor,
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .02,
                left: MediaQuery.of(context).size.width * .13,
                right: MediaQuery.of(context).size.width * .13,
                bottom: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewNote(),
                    ),
                  );
                },
                child: Text(
                  "New Note",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
