import 'package:flutter/material.dart';

void main() => runApp(FxAppRoot());

class FxAppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.blue
      ),
      home: FxRoute(),
    );
    }
}

class FxRoute extends StatefulWidget {
  @override
  _FxRouteState createState() => _FxRouteState();
}

class _FxRouteState extends State<FxRoute> with SingleTickerProviderStateMixin
{
  TabController _tabController;
  List tabs = ['新闻','历史','图片'];
  int _selectedIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabController应用"),
        bottom: TabBar(
            tabs: tabs.map((e)=>Tab(text: e)).toList(),
            controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e){
            return Container(
              alignment: Alignment.center,
              child: Text(e,textScaleFactor: 5),
            );
          }).toList(),
      ),
//      bottomNavigationBar: BottomNavigationBar( // 底部导航
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
//          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),

     bottomNavigationBar: Material(
      color: Colors.grey,
      child: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=>Tab(text: e,icon: Icon(Icons.home),)).toList(),
          indicatorColor: Colors.blue,
      ),
    ),
    );
  }
}
