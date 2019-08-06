import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'CountState.dart';
void main(){
  final store = new Store<CountState>(reducer,initialState: CountState.initState());
  runApp( MyApp(store) );
  }

class MyApp extends StatelessWidget {
  final Store<CountState> store;
  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return
      StoreProvider<CountState>(
        store: store,
        child:  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CountState,int>(
              converter: (store)=> store.state.count,
              builder: (context,count){
                return Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 30
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState,VoidCallback>(
          builder: (context,callback){
            return FloatingActionButton(
              onPressed: callback,
              child: Icon(Icons.add),
            );
          },
          converter: (store){
           return () => store.dispatch(Actiossssn.increment);
          }
      )
    );
    }
}
