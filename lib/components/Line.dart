import 'package:flutter/material.dart';

void main() {
  runApp(LineApp());
}

class LineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinePage(),
    );
  }
}

class LinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line UI'),
      ),
      body: Center(
        child: Container(
          height: 1.0, // Adjust the height according to your preference
          color: Colors.grey,
        ),
      ),
    );
  }
}
