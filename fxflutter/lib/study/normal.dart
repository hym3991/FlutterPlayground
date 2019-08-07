import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          width: 750,
          height: 562,
        ),
      ),
    );
  }
}
