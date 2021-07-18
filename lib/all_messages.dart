import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:hive/hive.dart';
import 'package:testing_run/new_note.dart';
import 'package:testing_run/sqlflite_noteKeeping/new_note.dart';

Widget notes(BuildContext context) {
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
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewNote()),
              );
            },
            leading: Icon(
              Icons.delete,
            ),
            title: Text('The Beginning of the world'),
            trailing: Checkbox(value: true, onChanged: (s) {}),
            subtitle: Text(
              'In the beginning, God created the and the earth',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    },
  );
}
