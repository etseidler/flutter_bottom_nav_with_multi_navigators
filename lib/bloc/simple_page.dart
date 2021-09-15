import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav/simple_detail.dart';

class SimplePage extends StatelessWidget {
  final String text;
  final String title;
  final Function onPush;
  SimplePage({required this.text, required this.title, required this.onPush});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BLETTER"), backgroundColor: Colors.teal),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            FloatingActionButton(onPressed: () => onPush(), child: Text('->'))
          ],
        ),
      ),
    );
  }
}
