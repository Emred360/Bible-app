import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:testing_run/main.dart';
import 'package:testing_run/user_accounts/create_account.dart';

import '../colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Initially password is obscure
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Do not have an account?"),
            TextButton(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage1(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .345,
                ),
                height: MediaQuery.of(context).size.height * .58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  border: Border.all(
                    width: .5,
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .08,
                        left: MediaQuery.of(context).size.width * .13,
                        right: MediaQuery.of(context).size.width * .13,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                          ),
                          hintText: "Username",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        autocorrect: true,
                        cursorColor: kprimaryColor,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02,
                        left: MediaQuery.of(context).size.width * .13,
                        right: MediaQuery.of(context).size.width * .13,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        validator: (val) =>
                            val.length < 6 ? 'Password too short.' : null,
                        onSaved: (val) => _password = val,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          hintText: "Password",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _obscureText = !_obscureText;
                                },
                              );
                            },
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kprimaryColor,
                            ),
                          ),
                        ),
                        obscureText: _obscureText,
                        autocorrect: true,
                        cursorColor: kprimaryColor,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        170,
                        0,
                        0,
                        0,
                      ),
                      child: Text("Forgot Password?"),
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        color: kprimaryColor,
                      ),
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02,
                        left: MediaQuery.of(context).size.width * .13,
                        right: MediaQuery.of(context).size.width * .13,
                        bottom: 10,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("or sign in with"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("signin with Google");
                          },
                          child: CircleAvatar(
                            child: Image.asset("assets/icons/google-icon.png"),
                            radius: 10,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("signin with Facebook");
                          },
                          child: CircleAvatar(
                            child: Image.asset("assets/icons/fb.jfif"),
                            radius: 10,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("signin with twitter");
                          },
                          child: CircleAvatar(
                            child: Image.asset("assets/icons/twitter-icon.png"),
                            radius: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .5,
              left: MediaQuery.of(context).size.width * .38,
            ),
            child: Image.asset(
              "assets/icons/logo.png",
            ),
          ),
        ],
      ),
    );
  }
}
