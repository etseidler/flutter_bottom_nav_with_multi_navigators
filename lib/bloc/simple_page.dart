import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav/simple_detail.dart';

class SimplePage extends StatelessWidget {
  final String text;
  final String title;
  final Icon icon;
  final Function onPush;
  SimplePage(
      {required this.text,
      required this.title,
      required this.icon,
      required this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.teal),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            FloatingActionButton(onPressed: () => onPush(), child: Text('->'))
          ],
        ),
      ),
    );
  }
}
