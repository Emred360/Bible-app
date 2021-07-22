import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart'; 
import 'package:testing_run/user_accounts/edit_profile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              height: 42,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvatarView(
                        imagePath: "assets/images/semi.jpg",
                        radius: 30,
                        backgroundColor: Colors.red,
                      ),
                      Spacer(),
                      Text(
                        "Username",
                      ),
                      Text(
                        "someonemail@email.com",
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: kprimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: kprimaryColor,
                ),
                title: Text(
                  "About",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.chrome_reader_mode,
                  color: kprimaryColor,
                ),
                title: Text(
                  "Messages",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.notes_sharp,
                  color: kprimaryColor,
                ),
                title: Text(
                  "Notes",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: kprimaryColor,
                ),
                title: Text(
                  "Share",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_applications,
                  color: kprimaryColor,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 46,
          ),
          Material(
            borderRadius: BorderRadius.circular(500),
            child: InkWell(
              borderRadius: BorderRadius.circular(500),
              splashColor: Colors.black45,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'v1.0.1',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
