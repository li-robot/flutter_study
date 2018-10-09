
import 'package:flutter/material.dart';

class AbsLayoutPage extends StatelessWidget{

  String msg;

  AbsLayoutPage({this.msg});


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AbsLayoutPage"),
      ),
      body: new IndexedStack(
        alignment: Alignment.center,
        children: <Widget>[
          new Container(
            width: 300.0,
            height: 300.0,
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.red,
            child: new FlatButton(onPressed: (){}, child: new Text("ok"),color: Colors.amber, highlightColor: Colors.cyan,)
          ),
          new Container(
            width: 400.0,
            height: 400.0,
            color: Colors.blue,
            child: new FlatButton(onPressed: (){}, child: new Image.asset('images/881649.jpg')),
          ),
          new Container(
            width: 1000.0,
            height: 500.0,
            color: Colors.cyan,
            child: new FlatButton(onPressed: (){}, child: new Container(
              child: new Text("test"),
            ))
          )
        ],
        index: 2,
      ),
    );
  }
}