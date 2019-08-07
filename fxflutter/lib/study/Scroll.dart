import 'package:flutter/material.dart';

class MyScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: str.split("").map((c)=>Text(c,textScaleFactor: 2,)).toList()
          ),
        ),
      ),
    );
  }
}
