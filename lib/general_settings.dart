import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart';

class GeneralSettings extends StatefulWidget {
  @override
  _GeneralSettingsState createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Settings"),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            onTap: () {
              print("About App");
            },
            leading: Icon(
              Icons.info_sharp,
              color: kprimaryColor,
            ),
            title: Text(
              "About App",
            ),
            horizontalTitleGap: 10.0,
          ),
          ListTile(
            onTap: () {
              print("About App");
            },
            leading: Icon(
              Icons.sms,
              color: kprimaryColor,
            ),
            title: Text(
              "Bible Versions",
            ),
            
            horizontalTitleGap: 10.0,
          ),
          ListTile(
            onTap: () {
              print("About App");
            },
            leading: Icon(
              Icons.notifications,
              color: kprimaryColor,
            ),
            title: Text(
              "Notifications",
            ),
            horizontalTitleGap: 10.0,
          ),
          ListTile(
            onTap: () {
              print("About App");
            },
            leading: Icon(
              Icons.font_download,
              color: kprimaryColor,
            ),
            title: Text(
              "Fonts",
            ),
            horizontalTitleGap: 10.0,
          ),
          ListTile(
            onTap: () {
              print("About App");
            },
            leading: Icon(
              Icons.cached,
              color: kprimaryColor,
            ),
            title: Text(
              "Backup & Restore",
            ),
            horizontalTitleGap: 10.0,
          ),
        ],
      ),
    );
  }
}
