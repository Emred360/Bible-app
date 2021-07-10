import 'package:flutter/material.dart';

import '../colors.dart';

class BibleVersions extends StatefulWidget {
  @override
  _BibleVersionsState createState() => _BibleVersionsState();
}

class _BibleVersionsState extends State<BibleVersions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Bible Versions"),
        backgroundColor: kprimaryColor,
      ),
      bottomNavigationBar: BottomAppBar(
        color: kprimaryColor,
        child: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
