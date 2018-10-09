import 'package:flutter/material.dart';
import 'dart:convert';

class ListPage extends StatefulWidget{

  State createState(){
    print(parseData().length);
    return new ListPageState();
  }

}

List parseData(){
  return json.decode("[\"test\", \"test1\", \"test2\", \"test3\" ]");
}

class ListPageState extends State<ListPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListPage"),
      ),
      body: new ListView.builder(
          itemBuilder: buildItem,
          itemCount: 40,
          scrollDirection: Axis.vertical
      )
    );
  }


  Widget buildItem(BuildContext context, int index){
    return new Container(
      child: new InkWell(
        child: new Container(
            child: new Text("test  ${index}" , style: new TextStyle(fontSize: 30.0), textAlign: TextAlign.center),
          padding: EdgeInsets.symmetric(vertical: 30.0),
        ),
        onTap: (){
          Navigator.of(context).pop(index);
        },
      )
    );
  }

}
