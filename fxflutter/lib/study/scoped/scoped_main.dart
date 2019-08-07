import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'CountModel.dart';
void main() => runApp(MyApp());

CountModel countModel = CountModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModel<CountModel>(
      model: countModel,
      child: MaterialApp(
        home: MyHomePage(title: "Scoped Demo"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    }

  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<CountModel>(
      builder: (context,child,model){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(model.count.toString(),style: TextStyle(
                  fontSize: 48
                ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=>model.increment(),
            tooltip: "Increment",
            child: Icon(Icons.add),
          ),
        );
      },
    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//    );
  }
}
