import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart';
import 'package:testing_run/notes.dart';

import '../main.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: Text("Username"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(), elevation: 9.0,
        // child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        autofocus: false,
        tooltip: "Home Page",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllNotes(),
            ),
          );
        },
        child: Icon(
          Icons.home_sharp,
          color: Colors.white,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              28.0,
              0,
              18.0,
            ),
            child: Row(
              children: [
                Text(
                  "My Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            margin: EdgeInsets.fromLTRB(
              25,
              0,
              25,
              18.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: kWhiteShadow,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.person,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Adewale Semiloore Francis",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.mail,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "emailaddress@gmail.com",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SmartCuts(),
          RecentBookmarks(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              0,
              20.0,
            ),
            child: Center(
              child: Text(
                "RECENT MESSAGE",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          RecentMessage(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              0,
              20.0,
            ),
            child: Center(
              child: Text(
                "RECENT NOTE",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          RecentNote(),
        ],
      ),
    );
  }
}

class RecentMessage extends StatelessWidget {
  const RecentMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.1,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * .13,
      margin: EdgeInsets.fromLTRB(
        25,
        0,
        25,
        18.0,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              color: kprimaryColor,
              height: 20,
              margin: EdgeInsets.fromLTRB(
                100,
                0,
                100,
                10.0,
              ),
              child: Center(
                child: Text(
                  "22/12/2021",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              "Minister: Dunsin Oyekan",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Topic: He gave gifts to Men",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentNote extends StatelessWidget {
  const RecentNote({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.1,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * .13,
      margin: EdgeInsets.fromLTRB(
        25,
        0,
        25,
        68.0,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              color: kprimaryColor,
              height: 20,
              margin: EdgeInsets.fromLTRB(
                100,
                0,
                100,
                10.0,
              ),
              child: Center(
                child: Text(
                  "22/12/2021",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              "Minister: Dunsin Oyekan",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Topic: He gave gifts to Men",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentBookmarks extends StatelessWidget {
  const RecentBookmarks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * .27,
      padding: EdgeInsets.only(
        top: 3,
        left: 8,
        right: 8,
      ),
      margin: EdgeInsets.fromLTRB(
        25,
        0,
        25,
        18.0,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 56,
                height: 56,
                child: AvatarView(
                  imagePath: "assets/images/semi.jpg",
                  radius: 60,
                  borderColor: Colors.black,
                  onTap: () {},
                  borderWidth: .5,
                ),
              ),
              Column(
                children: [
                  Text(
                    "You recently bookmarked",
                  ),
                  Text(
                    "MATTHEW 2:15-20 (NIV)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Title of the bookmark",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "2d",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              9,
              12,
              0,
              8,
            ),
            child: Text(
              ''' Where he stayed until the death of Herod. And so was fulfilled what the Lord had said through the prophet: ""Out of Egypt I called my son.""  When Herod realized that he had been outwitted by the Magi, he was furious, and he gave orders to kill all the boys in Bethlehem and its vicinity who were two years old and under, in accordance with the time he had learned from the Magi. Then what was said through the prophet Jeremiah was fulfilled:  ""A voice is heard in Ramah, weeping and great mourning, Rachel weeping for her children and refusing to be comforted, because they are no more."" After Herod died, an angel of the Lord appeared in a dream to Joseph in Egypt and said, "Get up, take the child and his mother and go to the land of Israel, for those who were trying to take the child's life are dead." ''',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert_outlined,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SmartCuts extends StatelessWidget {
  const SmartCuts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .23,
      // color: Colors.orange,
      margin: EdgeInsets.fromLTRB(
        25,
        0,
        25,
        18.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  print("Notes Pressed");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  width: MediaQuery.of(context).size.width * .35,
                  child: Center(
                    child: Text(
                      "Notes",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Messages Pressed");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  width: MediaQuery.of(context).size.width * .35,
                  child: Center(
                    child: Text(
                      "Messages",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  print("Trash Pressed");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  width: MediaQuery.of(context).size.width * .35,
                  child: Center(
                    child: Text(
                      "Trash",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Bookmarks Pressed");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .09,
                  width: MediaQuery.of(context).size.width * .35,
                  child: Center(
                    child: Text(
                      "Bookmarks",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
