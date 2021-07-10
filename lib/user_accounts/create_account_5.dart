import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_run/user_accounts/login_success.dart';

import '../colors.dart';
import '../main.dart';
import 'create_account_2.dart';

class SignUpPage5 extends StatefulWidget {
  @override
  _SignUpPage5State createState() => _SignUpPage5State();
}

class _SignUpPage5State extends State<SignUpPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginSuccess(),
                ),
              );
            },
            child: Text(
              "Done",
              style: GoogleFonts.buenard(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 40,
              bottom: 60,
              start: 20,
            ),
            child: Text("STEP 5 OF 5"),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 0,
              bottom: 60,
              start: 20,
            ),
            child: Row(
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "(Password must be 6-8 characters)",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 0,
              bottom: 60,
              start: 20,
              end: MediaQuery.of(context).size.width * 0.2,
            ),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 0,
              bottom: 5,
              start: 20,
              end: 20,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By continuing, you agree to accept our ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Privacy Tapped");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " & ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Privacy Tapped");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                    text: "Terms of Service.",
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
