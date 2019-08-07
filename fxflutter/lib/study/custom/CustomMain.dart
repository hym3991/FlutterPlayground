import 'package:flutter/material.dart';
import 'CustomCenter.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
void main(){
  debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        color: Colors.blue,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          minWidth: 100,
          maxHeight: double.infinity,
          minHeight: 100
        ),
        child: CustomCenter(
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    ),
  ));


  }