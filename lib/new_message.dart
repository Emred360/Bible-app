import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_run/colors.dart';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:testing_run/drawer_menu.dart';

import 'package:testing_run/main.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerMenu(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("New Message"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        autofocus: false,
        tooltip: "Discard changes",
        onPressed: () {},
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: kprimaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                if (_drawerKey.currentState.isDrawerOpen) {
                  Navigator.pop(context);
                } else {
                  _drawerKey.currentState.openDrawer();
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
              20,
              10,
              20,
              15,
            ),
            height: 75.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0,
                    0,
                  ),
                  color: kWhiteShadow,
                  blurRadius: 0.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Topic:",
                    style: GoogleFonts.lato(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                TextField(
                  maxLines: 1,
                  autofocus: true,
                  style: GoogleFonts.lato(
                    fontSize: 17.0,
                  ),
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.fromLTRB(
              20,
              10,
              20,
              15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "SCRIPTURES",
                  ),
                ),
                Text(
                  "SCRIPTURES WILL APPEAR HERE",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_box,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => MessageDialogBox(),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.expand_more,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              20,
              5,
              20,
              15,
            ),
            height: 278.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0,
                    0,
                  ),
                  color: kWhiteShadow,
                  blurRadius: 0.0,
                )
              ],
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageDialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * .47,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: kprimaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jeremiah 13:10-20",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Save",
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              color: kprimaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 70,
                  right: 5,
                  left: 5,
                  bottom: 20,
                ),
                padding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 20,
                ),
                height: MediaQuery.of(context).size.height * .4,
                child: ListView(
                  children: [
                    Text(
                      '''This is the text of the letter that the prophet Jeremiah sent from Jerusalem to the surviving elders among the exiles and to the priests, the prophets and all the other people Nebuchadnezzar had carried into exile from Jerusalem to Babylon. (This was after King Jehoiachin and the queen mother, the court officials and the leaders of Judah and Jerusalem, the skilled workers and the artisans had gone into exile from Jerusalem.) He entrusted the letter to Elasah son of Shaphan and to Gemariah son of Hilkiah, whom Zedekiah king of Judah sent to King Nebuchadnezzar in Babylon. It said:  This is what the Lord Almighty, the God of Israel, says to all those I carried into exile from Jerusalem to Babylon: "Build houses and settle down; plant gardens and eat what they produce. Marry and have sons and daughters; find wives for your sons and give your daughters in marriage, so that they too may have sons and daughters. Increase in number there; do not decrease".''',
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: FloatingActionButton(
                  tooltip: "close",
                  backgroundColor: kprimaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
