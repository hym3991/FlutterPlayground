import 'package:flutter/material.dart';
import 'widget/AutoRootWidget.dart';
void main(){
  AutoRootWidget.ensureInitialized(750,2176)
      ..attachRootWidget(new MyApp())
      ..scheduleWarmUpFrame();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
             Container(
               color: Colors.blue,
               width: 750,
               height: 562,
             ),
//              Container(
//                color: Colors.grey,
//                width: 750,
//                height: 562,
//              ),
//              Container(
//                color: Colors.green,
//                width: 750,
//                height: 562,
//              ),
//              Container(
//                color: Colors.red,
//                width: 750,
//                height: 562,
//              ),
//              Container(
//                color: Colors.black,
//                width: 750,
//                height: 562,
//              ),
            ],
          )
        ),
      ),
    );
  }
}
