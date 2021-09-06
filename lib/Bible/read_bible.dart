import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart';
// import 'package:avatar_view/avatar_view.dart';
import 'package:testing_run/drawer_menu.dart';
import 'package:bible/bible.dart' as Bible;
import 'package:testing_run/models/passage.dart';
import 'package:testing_run/utils/shared_pref.dart';

class ReadBible extends StatefulWidget {
  final Passages psg;

  const ReadBible(
    this.psg, {
    Key key,
  }) : super(key: key);
  @override
  _ReadBibleState createState() => _ReadBibleState();
}

class _ReadBibleState extends State<ReadBible> {
  String _chosenVersion;
  int selectedIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  int currentIndex = 0;
  String messages;

  @override
  initState() {
    super.initState();

    Bible.addKeys({'esvapi': 'APITOKEN'});
    var passage = Bible.queryPassage(
        "${widget.psg.book} ${widget.psg.chapter} ${widget.psg.verses == null ? '' : ':'}${widget.psg.verses == null ? '' : widget.psg.verses}");
    passage.then((x) => {
          if (mounted)
            setState(() {
              messages = x.passage;
            })
          else
            messages = x.passage
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _drawerKey,
      drawer: DrawerMenu(),
      //APPBAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,

        // leading: Icon(
        //   Icons.hourglass_empty,
        // ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${widget.psg.book} ${widget.psg.chapter}${widget.psg.verses == null ? '' : ':'}${widget.psg.verses == null ? '' : widget.psg.verses}",
            ),
            // DropdownButtonHideUnderline(
            //   child: DropdownButton<String>(
            //     isExpanded: false,
            //     value: _chosenVersion,
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //     hint: Text(
            //       "KJV",
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //     items: <String>[
            //       "KJV",
            //       "NIV",
            //       "RSV",
            //       "MSG",
            //       "AMP",
            //     ].map<DropdownMenuItem<String>>(
            //       (String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(
            //             value,
            //             style: TextStyle(
            //               color: Colors.black,
            //             ),
            //           ),
            //         );
            //       },
            //     ).toList(),
            //     onChanged: (String value) {
            //       setState(
            //         () {
            //           _chosenVersion = value;
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 3.0,
      //   color: kprimaryColor,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: 65.0,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         SizedBox(
      //           width: 10.0,
      //         ),
      //         TextButton(
      //           style: ButtonStyle(
      //             backgroundColor:
      //                 MaterialStateProperty.all(Colors.transparent),
      //           ),
      //           onPressed: () {},
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   if (_drawerKey.currentState.isDrawerOpen) {
      //                     Navigator.pop(context);
      //                   } else {
      //                     _drawerKey.currentState.openDrawer();
      //                   }
      //                 },
      //                 child: Icon(
      //                   Icons.menu,
      //                   color: Colors.white,
      //                   size: 30.0,
      //                 ),
      //               ),
      //               // Text("Home")
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           width: 20.0,
      //         ),
      //         TextButton(
      //           style: ButtonStyle(
      //             backgroundColor:
      //                 MaterialStateProperty.all(Colors.transparent),
      //           ),
      //           onPressed: () {},
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.copy,
      //                 color: Colors.white,
      //                 size: 30.0,
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           width: 20.0,
      //         ),
      //         Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.select_all,
      //               color: Colors.white,
      //               size: 30.0,
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           width: 20.0,
      //         ),
      //         Column(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Icon(
      //               Icons.share,
      //               color: Colors.white,
      //               size: 30.0,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
          SharedPref.saved(messages);
          Navigator.popUntil(context, ModalRoute.withName('NewMessage'));
        },
        child: Icon(
          Icons.check,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        width: MediaQuery.of(context).size.width * 5.0,
        // color: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        height: MediaQuery.of(context).size.height * 0.81,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          children: [SelectableText("$messages")],
        ),
      ),
    );
  }
}
