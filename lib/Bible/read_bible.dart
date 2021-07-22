import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart';
// import 'package:avatar_view/avatar_view.dart';
import 'package:testing_run/drawer_menu.dart';

class ReadBible extends StatefulWidget {
  @override
  _ReadBibleState createState() => _ReadBibleState();
}

class _ReadBibleState extends State<ReadBible> {
  String _chosenVersion;
  int selectedIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int currentIndex = 0;
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
              "Jeremiah 29",
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: false,
                value: _chosenVersion,
                style: TextStyle(
                  color: Colors.white,
                ),
                hint: Text(
                  "KJV",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                items: <String>[
                  "KJV",
                  "NIV",
                  "RSV",
                  "MSG",
                  "AMP",
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (String value) {
                  setState(
                    () {
                      _chosenVersion = value;
                    },
                  );
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 3.0,
        color: kprimaryColor,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 65.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 10.0,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                        size: 30.0,
                      ),
                    ),
                    // Text("Home")
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.copy,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.select_all,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {},
        child: Icon(
          Icons.check,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
          children: [
            SelectableText(
                "1 This is the text of the letter that the prophet Jeremiah sent from Jerusalem to the surviving elders among the exiles and to the priests, the prophets and all the other people Nebuchadnezzar had carried into exile from Jerusalem to Babylon. 2 (This was after King Jehoiachin[a] and the queen mother, the court officials and the leaders of Judah and Jerusalem, the skilled workers and the artisans had gone into exile from Jerusalem.) 3 He entrusted the letter to Elasah son of Shaphan and to Gemariah son of Hilkiah, whom Zedekiah king of Judah sent to King Nebuchadnezzar in Babylon. It said: 4 This is what the Lord Almighty, the God of Israel, says to all those I carried into exile from Jerusalem to Babylon: 5 “Build houses and settle down; plant gardens and eat what they produce. 6 Marry and have sons and daughters; find wives for your sons and give your daughters in marriage, so that they too may have sons and daughters. Increase in number there; do not decrease. 7 Also, seek the peace and prosperity of the city to which I have carried you into exile. Pray to the Lord for it, because if it prospers, you too will prosper.” 8 Yes, this is what the Lord Almighty, the God of Israel, says: “Do not let the prophets and diviners among you deceive you. Do not listen to the dreams you encourage them to have. 9 They are prophesying lies to you in my name. I have not sent them,” declares the Lord. 10 This is what the Lord says: “When seventy years are completed for Babylon, I will come to you and fulfil my good promise to bring you back to this place. 11 For I know the plans I have for you,” declares the Lord, “plans to prosper you and not to harm you, plans to give you hope and a future. 12 Then you will call on me and come and pray to me, and I will listen to you. 13 You will seek me and find me when you seek me with all your heart. 14 I will be found by you,” declares the Lord, “and will bring you back from captivity.[b] I will gather you from all the nations and places where I have banished you,” declares the Lord, “and will bring you back to the place from which I carried you into exile.”")
          ],
        ),
      ),
    );
  }
}
