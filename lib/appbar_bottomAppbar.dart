import 'package:flutter/material.dart';

import 'components/constants.dart';

class AppBarBottomAppBar extends StatefulWidget {
  @override
  AppBarBottomAppBarState createState() => AppBarBottomAppBarState();
}

class AppBarBottomAppBarState extends State<AppBarBottomAppBar> {
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
