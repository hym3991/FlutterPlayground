import 'package:flutter/material.dart';
import 'User.dart';
import 'route/new_route.dart';
void main() => runApp(FxAppRoot());

class FxAppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.blue
      ),
      home: FxAppRoute(),
    );
    }
}

class FxAppRoute extends StatefulWidget {
  @override
  _FxAppRouteState createState() => _FxAppRouteState();
}

class _FxAppRouteState extends State<FxAppRoute> {
  int _selectIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){})
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(IconData(0xe607,fontFamily: 'wxcIconFont')),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _onAdd,
          child: Icon(Icons.add),
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }
  void _onAdd(){
    User s = User("ada", "aaaa");

  }
}

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            onTap: _goNext(context),
            title: Text("item 1"),
          ),
          ListTile(
            onTap: _goNext(context),
            title: Text("item 2"),
          ),
          ListTile(
            onTap: _goNext(context),
            title: Text("item 3"),
          ),
          ListTile(
            onTap: _goNext(context),
            title: Text("item 4"),
          ),
          ListTile(
            onTap: _goNext(context),
            title: Text("item 5"),
          ),
          ListTile(
            title: Text("item 6"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _goNext(BuildContext context) {
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return new NewRoute();
    }));
  }
}

