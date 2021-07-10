import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_run/colors.dart';

class NewNote extends StatefulWidget {
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  double height = 95;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.close,
        ),
        onPressed: () {},
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
                  onPressed: () {
                    print("row 1 preessed");
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.save_sharp),
              onPressed: () {
                print("row 1 presssed");
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print("row 1 presssed");
              },
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Text("New Note"),
        centerTitle: true,
        elevation: 3,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        // scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Guest Minister",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Pastor Kingsley Okonkwo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Topic",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "He gave Gifts to Men",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            height: height,
            duration: Duration(milliseconds: 700),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Scriptures",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Matt. 21:11-20",
                    ),
                    Text(
                      "Matt. 21:11-20",
                    ),
                    Text(
                      "Matt. 21:11-20",
                    ),
                  ],
                ),
                ExpansionTile(
                  onExpansionChanged: (s) {
                    setState(
                      () => s ? height = 200 : height = 95,
                    );
                  },
                  title: Text(""),
                  children: [
                    Wrap(
                      children: [
                        TextButton(
                          child: Text(
                            "Gen 4:12",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: Text("Gen 4:12"),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: Text("Gen 4:12"),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.41,
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
              scrollDirection: Axis.vertical,
              child: Text(
                  "Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using. Using the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using the homepage feature listed in the brief sing the skills we’ve learnt so far, wireframe the homepage using.  "),
            ),
          ),
        ],
      ),
    );
  }
}
