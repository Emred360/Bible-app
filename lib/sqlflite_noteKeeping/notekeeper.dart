import 'package:flutter/material.dart';
import 'package:testing_run/colors.dart';
import 'package:testing_run/sqlflite_noteKeeping/noteDetail.dart';
import 'package:testing_run/utils/database_helper.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:sqflite/sqflite.dart';

class NoteeList extends StatefulWidget {
  // const NoteeList({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteeListState();
  }
}

class NoteeListState extends State<NoteeList> {
  List<Note> noteList;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    Note note;
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }
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
              builder: (context) => NoteDetail(
                note,
                "appBarTitle",
              ),
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

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          child: ListTile(
            onTap: () {
              debugPrint("Note Tile Pressed");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetail(
                      Note("5", "the message", 2, "Scripture", "Pst Kingsley"),
                      ""),
                ),
              );
            },
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: kprimaryColor,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            title: Text(
              this.noteList[position].topic,
            ),
            subtitle: Text(
              this.noteList[position].date,
            ),
            leading: CircleAvatar(
              backgroundColor:
                  getPriorityColor(this.noteList[position].priority),
              child: getPriorityIcon(this.noteList[position].priority),
            ),
          ),
        );
      },
    );
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return kprimaryColor;
        break;
      default:
        return kprimaryColor;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.favorite);
        break;
      case 2:
        return Icon(
          Icons.favorite_border_outlined,
        );
        break;
      default:
        return Icon(Icons.favorite_border_outlined);
    }
  }

  void _delete(BuildContext context, Note note) async {
    var databaseHelper;
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String messssage) {
    final snackBar = SnackBar(content: Text(messssage));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetil(Note note, String topic) async {
    bool result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return NoteDetail(note, topic);
      },
    ));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    var databaseHelper;
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((databse) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
