import 'package:flutter/material.dart';

void main() => runApp(FxAppRoot());

class FxAppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.blue
      ),
      home: FxAppRootHome(),
    );
  }
}

class FxAppRootHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("FxFlutter 学习计划"),
      ),
      body: FxAppRootBody(),
    );
  }
}

class FxAppRootBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Demo2Refresh(),
    );
  }
}

class Demo1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Text("demo1"),
    );
  }
}

class Demo2Refresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Demo2(),
        onRefresh: onrefresh,
    );
  }

  Future<void> onrefresh() {
    print("refresh");
  }
}


class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return new Item1();
      },
      itemCount: 20,);
  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: FlatButton(
            onPressed: (){print("click");},
            child: Padding(
              padding: EdgeInsets.fromLTRB(0,10,10,10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      "描述",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(top: 6,bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "star1000"),
                      _getBottomItem(Icons.link, "linl2000"),
                      _getBottomItem(Icons.access_time, "time3000")
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  _getBottomItem(IconData icons,String title){
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon( icons,size: 16,color: Colors.grey),
            Padding(padding: EdgeInsets.only(left: 5),),
            Text(title,style: TextStyle(color: Colors.deepOrange,fontSize: 14),overflow: TextOverflow.ellipsis,maxLines: 1,)
          ],
        ),
      ),
    );
  }
}





