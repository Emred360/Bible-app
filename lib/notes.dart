import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_run/Bible/select_book.dart';
import 'package:testing_run/all_messages.dart';
import 'package:testing_run/all_notes.dart';
import 'package:testing_run/components/newMessage_Note.dart';
import 'package:testing_run/drawer_menu.dart';
// import 'package:testing_run/main.dart';
// import 'package:testing_run/new_message.dart';
// import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
// import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
// import 'package:testing_run/sqlflite_noteKeeping/notekeeper.dart';
import 'package:testing_run/user_accounts/create_account.dart';

import 'package:testing_run/components/constants.dart';
import 'sqlflite_noteKeeping/notekeeper.dart';

class AllNotes extends StatefulWidget {
  @override
  _AllNotesState createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewMessageNote(),
            ),
          );
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Bib",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: "note",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print("Search button pressed");
            },
          ),
        ],
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        centerTitle: true,
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
                        children: [
                          messages(context),
                          notes(context), //it should call getNoteListView()
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
}
