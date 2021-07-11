import 'package:flutter/material.dart';
import 'package:testing_run/colors.dart';
import 'package:testing_run/sqlflite_noteKeeping/noteDetail.dart';

class NoteeList extends StatefulWidget {
  // const NoteeList({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteeListState();
  }
}

class NoteeListState extends State<NoteeList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notes",
        ),
        backgroundColor: kprimaryColor,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
          debugPrint("FAB Pressed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteDetail(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        tooltip: "Add Note",
      ),
    );
  }
}

ListView getNoteListView() {
  return ListView.builder(
    itemCount: 0,
    itemBuilder: (BuildContext context, int position) {
      return Card(
        child: ListTile(
          onTap: () {
            debugPrint("Note Tile Pressed");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetail(),
              ),
            );
          },
          leading: Icon(
            Icons.delete,
            color: kprimaryColor,
          ),
          title: Text(
            "Note Title",
          ),
          subtitle: Text("Note Date"),
          trailing: Icon(
            Icons.favorite_outline,
            color: kprimaryColor,
          ),
        ),
      );
    },
  );
}
