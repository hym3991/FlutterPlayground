import 'package:flutter/material.dart';

void main() => runApp(FxAppRoot());

class FxAppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.blue
      ),
      home: FxPullLoad(),
    );
    }
}

class FxPullLoad extends StatefulWidget {
  @override
  _FxPullLoadState createState() => _FxPullLoadState();
}

class _FxPullLoadState extends State<FxPullLoad> {
  final ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
