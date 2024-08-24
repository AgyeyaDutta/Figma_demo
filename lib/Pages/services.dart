// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void button(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('Button Works'),
        actions: <Widget>[
          TextButton(
            child:  Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
