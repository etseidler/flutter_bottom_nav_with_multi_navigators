import 'package:flutter/material.dart';

class SimpleDetailPage extends StatelessWidget {
  final String text;
  final String title;
  SimpleDetailPage({required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backwardsCompatibility: false,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
