import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Text("This is new study.route"),
      ),
    );
  }
}