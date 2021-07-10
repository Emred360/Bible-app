import 'package:flutter/material.dart';
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
          child: ListTile(
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
        ),
      );
    },
  );
}
