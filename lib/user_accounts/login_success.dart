import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_run/components/constants.dart';
// import 'package:testing_run/colors.dart';
import 'package:testing_run/main.dart';

class LoginSuccess extends StatefulWidget {
  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        centerTitle: true,
        title: Text("Login Success"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            painter: OpenPainter(),
          ),
          Center(
            child: CircleAvatar(
              radius: 90,
              backgroundColor: kprimaryColor,
              child: Icon(
                Icons.check,
                size: 120,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Login Successful",
            style: GoogleFonts.buenard(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  "Back to home",
                  style: GoogleFonts.buenard(
                    color: Colors.white,
                    fontSize: 30,
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

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = kprimaryColor
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 20
      ..strokeWidth = 10;
    //list of points
    var points = [
      // all Positive //
      Offset(150, 105),
      Offset(92, 125),
      Offset(95, 16),
      Offset(105, 10),
      Offset(92, 165),
      Offset(162, 16),
      // all Negative //
      Offset(-150, 105),
      Offset(-92, 125),
      Offset(-95, 16),
      Offset(-105, 10),
      Offset(-92, 165),
      Offset(-162, 16),
    ];
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
