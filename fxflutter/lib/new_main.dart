import 'package:flutter/material.dart';
import 'tab_main2.dart';
import 'Scroll.dart';
import 'eventbus/EventBus.dart';
void main()=>runApp(NewRoot());

class NewRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewHome(),
    );
  }
}

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new main"),
      ),
      body: FormRoute(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print("aaaaaaa");
      },child: Icon(Icons.add),),
    );
  }
}

class Body1 extends StatefulWidget {

  Body1({Key key}):super(key:key);

  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  bool _active = false;
  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active?"Activity":"Inactive",
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }
}

class Filed extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)
            ),
            onChanged: (v){
              print("onChange: $v");
            },
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登陆密码",
              prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
            onChanged: (v){
              print("onChange: $v");
            },
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          RaisedButton(
              onPressed: ()=> print(_controller.text),
              child: Text("登陆")
          ),
        ],
      ),
    );

  }
}

class FocusRouer extends StatefulWidget {
  @override
  _FocusRouerState createState() => _FocusRouerState();
}

class _FocusRouerState extends State<FocusRouer> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "inout1"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2"
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: (){
                    if(null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }else{
                      focusScopeNode.requestFocus(focusNode2);
                    }
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: (){
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          })
        ],
      ),
    );
  }
}


class FormRoute extends StatefulWidget {
  @override
  _FormRouteState createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
      child: Form(
        key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入",
                  //icon: Icon(Icons.person)
                ),
                validator: (v){
                  return v.trim().length > 0?null:"用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入",
                  icon: Icon(Icons.lock) ,
                ),
                validator: (v){
                  return v.trim().length > 5?null:"密码不能少于6位";
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 28),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15),
                        child: Text("登陆"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                            if((_formKey.currentState as FormState).validate())
                              {

                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return MyScrollView();
                                }));
                              }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}


