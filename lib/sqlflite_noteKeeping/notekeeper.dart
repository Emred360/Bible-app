import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_run/Bible/select_book.dart';
import 'package:testing_run/all_messages.dart';
import 'package:testing_run/components/constants.dart';
import 'package:testing_run/components/newMessage_Note.dart';
import 'package:testing_run/drawer_menu.dart';
import 'package:testing_run/models/sqlflite_messageDB.dart';
import 'package:testing_run/sqlflite_noteKeeping/messageDetail.dart';
import 'package:testing_run/sqlflite_noteKeeping/new_message.dart';
import 'package:testing_run/sqlflite_noteKeeping/new_note.dart';
import 'package:testing_run/sqlflite_noteKeeping/noteDetail.dart';
import 'package:testing_run/user_accounts/create_account.dart';
import 'package:testing_run/utils/database_helper.dart';
import 'package:testing_run/models/sqlflite_noteDB.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testing_run/utils/database_helper_message.dart';

class NoteeList extends StatefulWidget {
  // const NoteeList({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteeListState();
  }
}

class NoteeListState extends State<NoteeList> with TickerProviderStateMixin {
  List<Note> noteList;
  List<MessageM> messaageList;

  int count = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex = 0;
  Note note;
  MessageM messaageM;
  TabController _controller;
  TabController _controllerM;
  @override
  initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    if (noteList == null) {
      noteList = [];
      print("Note is here");
      getNoteListView();
      // updateListView();
      getCursors();
    }

    _controller.addListener(() {
      setState(() => currentIndex = _controller.index);
    });
    //Note
    _controllerM = TabController(length: 2, vsync: this);
    if (messaageList == null) {
      messaageList = [];

      print("Message is here");
      getMessageListView();
      // updateListView();
      getCursorsM();
    }

    _controllerM.addListener(() {
      setState(() => currentIndex = _controllerM.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        backgroundColor: Colors.white,
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => currentIndex == 0
                  ? NewMessage()
                  : NewNote(), //or => if (tab.index = "MESSAGE"){goto Navigator.push(NewMessage)}else{goto Navigator.push(NewNote)}
            ),
          ).then((value) => currentIndex == 0 ? getCursorsM() : getCursors());
        },
        child: Icon(
          Icons.add,
          color: kprimaryColor,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: kprimaryColor,
        child: Container(
          height: 50,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SvgPicture.asset(
              //   "assets/svg/menu.svg",
              //   color: Colors.white,
              // ),
              GestureDetector(
                onTap: () {
                  if (_drawerKey.currentState.isDrawerOpen) {
                    Navigator.pop(context);
                  } else {
                    _drawerKey.currentState.openDrawer();
                  }
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage1()));
                },
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.share_rounded,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectBooks(),
                    ),
                  );
                },
                child: Icon(
                  Icons.chrome_reader_mode,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      key: _drawerKey,
      drawer: DrawerMenu(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Bib",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: "note",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TabBar(
                    labelColor: kprimaryColor,
                    controller: _controller,
                    indicatorPadding: EdgeInsets.all(6.0),
                    tabs: [
                      Tab(text: "MESSAGES"),
                      Tab(
                        text: "NOTES",
                      ),
                    ],
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.red,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .735,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 4.0),
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          getMessageListView(),
                          getNoteListView(), //it should call getNoteListView()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView getNoteListView() {
    // return noteList.isNotEmpty
    //     ?
    return ListView.builder(
      itemCount: noteList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: kprimaryColor,
                height: 15,
                width: 80,
                padding: EdgeInsets.only(
                  left: 1.0,
                  top: 0,
                ),
                margin: EdgeInsets.only(
                  bottom: 0,
                ),
                child: Center(
                  child: Text(
                    this.noteList[position].date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  // OnTap=> Edit Note
                  debugPrint("Note Tile Pressed");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteDetail(noteList[position], ""),
                    ),
                  );
                },
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: kprimaryColor,
                  ),
                  onTap: () {
                    _delete(
                      context,
                      noteList[position],
                    );
                  },
                ),
                title: Center(
                  child: Text(
                    this.noteList[position].minister,
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    this.noteList[position].topic,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  // getPriorityColor(this.noteList[position].priority),
                  child: getPriorityIcon(this.noteList[position].priority),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//Message
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
        return Icon(
          Icons.favorite,
          color: Colors.red,
        );
        break;
      case 2:
        return Icon(
          Icons.favorite_border_outlined,
        );
        break;
      default:
        return Icon(Icons.favorite);
    }
  }

  void _delete(BuildContext context, Note note) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
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
    DatabaseHelper databaseHelper = DatabaseHelper();
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

  void getCursors() async {
    DatabaseHelper helper = DatabaseHelper();
    await helper.getNoteList().then((value) {
      print("hmmm mmghj  ${value.length}");
      setState(() => noteList = value);
    });
  }

  ListView getMessageListView() {
    return ListView.builder(
      itemCount: messaageList.length,
      itemBuilder: (BuildContext context, int positionM) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: kprimaryColor,
                height: 15,
                width: 80,
                padding: EdgeInsets.only(
                  left: 1.0,
                  top: 0,
                ),
                margin: EdgeInsets.only(
                  bottom: 0,
                ),
                child: Center(
                  child: Text(
                    this.messaageList[positionM].dateM,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  // OnTap=> Edit Message
                  debugPrint(
                    "Message Tile Pressed",
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MessageDetail(messaageList[positionM], ""),
                    ),
                  );
                },
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: kprimaryColor,
                  ),
                  onTap: () {
                    log("dtta --- ${messaageList[positionM].toMap()}");
                    _deleteM(
                      context,
                      messaageList[positionM].idM,
                    );
                  },
                ),
                title: Center(
                  child: Text(
                    this.messaageList[positionM].topicM,
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    this.messaageList[positionM].scriptureM,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color getPriorityColorM(int priorityM) {
    switch (priorityM) {
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

  Icon getPriorityIconM(int priorityM) {
    switch (priorityM) {
      case 1:
        return Icon(
          Icons.favorite,
          color: Colors.red,
        );
        break;
      case 2:
        return Icon(
          Icons.favorite_border_outlined,
        );
        break;
      default:
        return Icon(Icons.favorite);
    }
  }

  void _deleteM(BuildContext context, int id) async {
    DatabaseHelperM databaseHelperM = DatabaseHelperM();

    log("h,,, - $id");
    int resultM = await databaseHelperM.deleteMessageM(id);
    if (resultM != 0) {
      getCursorsM();
      _showSnackBarM(context, 'Message Deleted Successfully');
    }
  }

  void _showSnackBarM(BuildContext context, String messageM) {
    final snackBarM = SnackBar(content: Text(messageM));
    Scaffold.of(context).showSnackBar(snackBarM);
  }

  void navigateToMessaageDetil(MessageM messageM, String topicM) async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MessageDetail(messageM, topicM);
      },
    )).then((value) {
      log("oga ooo");
      if (value) {
        _showAlertDialogM('status:', 'Message Updated Successfully');
      } else {
        _showAlertDialogM('status:', 'Problem Saving Message');
      }
      getCursorsM();
    });
  }

  void _showAlertDialogM(String topicM, String dateM) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(topicM),
      content: Text(dateM),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void updateListViewM() {
    print("logsss");
    DatabaseHelperM databaseHelperM = DatabaseHelperM();
    final Future<Database> dbFutureM = databaseHelperM.initializeDatabase();
    dbFutureM.then((databseM) {
      messaageList = [];

      databaseHelperM.getMessageList().then((messageList) {
        log("no error? ${messaageList}");
        setState(() {
          messaageList = messaageList;
          count = messaageList.length;
        });
      });
    });
  }

  void getCursorsM() async {
    DatabaseHelperM helperM = DatabaseHelperM();
    await helperM.getMessageList().then((value) {
      print("hmmm oh alit  ${value.length}");
      setState(() => messaageList = value);
    });
  }
}
