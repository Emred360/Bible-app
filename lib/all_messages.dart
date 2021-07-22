import 'package:flutter/material.dart';
import 'package:testing_run/components/constants.dart';
// import 'dart:io';

// import 'package:hive/hive.dart';

Widget messages(BuildContext context) {
  return ListView.builder(
    itemCount: 34,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: Card(
          //<-- Card widget
          child: Padding(
            padding: EdgeInsets.only(
              left: 1.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: kprimaryColor,
                  height: 15,
                  width: 80,
                  padding: EdgeInsets.only(
                    left: 1.0,
                    top: 0,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: Center(
                    child: Text(
                      "02/10/2021",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.delete),
                  title: Text('Minister Dunsin Oyekan'),
                  trailing: Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                  subtitle: Text(
                    'He Gave Gifts To Men',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
