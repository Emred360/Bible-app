import 'package:flutter/material.dart';
import 'package:testing_run/Bible/book_library.dart';
// import 'package:testing_run/main.dart';
import 'package:testing_run/Bible/select_verse.dart';
import 'package:testing_run/models/passage.dart';
import 'package:testing_run/notes.dart';

import 'package:testing_run/components/constants.dart';

class SelectChapter extends StatefulWidget {
  final String book;

  const SelectChapter(
    this.book, {
    Key key,
  }) : super(key: key);
  @override
  _SelectChapterState createState() => _SelectChapterState();
}

class _SelectChapterState extends State<SelectChapter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.close,
            color: kprimaryColor,
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
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
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          automaticallyImplyLeading: false,
          title: Text("Select Chapter"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white38,
            )
          ]),
          margin: EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 20.0,
          ),
          height: MediaQuery.of(context).size.height * .70,
          width: MediaQuery.of(context).size.width * .90,
          // color: Colors.grey,
          child: GridView.builder(
            itemCount: 45,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(
                      width: 1, color: Colors.black, style: BorderStyle.solid),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Number Pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectVerse(
                          Passages(widget.book, '${index + 1}'),
                        ),
                        settings: RouteSettings(
                          name: 'SelectVerse'
                        ),
                      ),
                    );
                  },
                  child: Text(
                    selectChapters[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
