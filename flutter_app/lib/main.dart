import 'package:flutter/material.dart';
import 'package:flutter_app/ListPage.dart';
import 'package:flutter_app/AbsLayoutPage.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: new MyHomePage(title: 'Home Page'),
    );
  }
}

Future<int> gotoPage(BuildContext context) async{
  int result = await Navigator.of(context).push(new MaterialPageRoute(builder: (ctx){
    return new ListPage();
  }));
  return result;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Wrap(
          children: <Widget>[

            new GestureDetector(
              child: new Container(
                    child:  new Text("open", style: new TextStyle(fontSize: 20.0)),
                    padding: EdgeInsets.all(10.0),
                    width: 80.0,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.red, width: 2.0),
                        borderRadius: new BorderRadius.circular(5.0)
                    )
              ),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (ctx){
                  return new AbsLayoutPage(msg: "test",);
                }));
              },
            ),
            new Builder(builder: (ctx){
              return new GestureDetector(
                child: new Container(
                    child:  new Text("show", style: new TextStyle(fontSize: 20.0)),
                    padding: EdgeInsets.all(10.0),
                    width: 80.0,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.red, width: 2.0),
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
                onTap: (){
                  Scaffold.of(ctx).showBottomSheet((ctx){
                    return new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Container(
                          child: new Text("相册"),
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.white,
                          alignment: Alignment.center,
                        ),
                        new Divider(
                          color: Colors.black,
                          height: 1.0,
                        ),
                        new Container(
                          child: new Text("相机"),
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.white,
                          alignment: Alignment.center,
                        )
                      ],
                    );
                  });
                },
              );
            }),
            new GestureDetector(
              child: Container(
                    child:  new Text("close", style: new TextStyle(fontSize: 20.0)),
                    padding: EdgeInsets.all(10.0),
                    width: 80.0,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.red, width: 2.0),
                        borderRadius: new BorderRadius.circular(5.0)
                    )
              ),
              onTap: (){
                MethodChannel channel = new MethodChannel("com.robot/closeSelf");
                channel.invokeMethod("closeSelf");
              },
            ),
            new Container(
              child:  new Text("hide", style: new TextStyle(fontSize: 20.0)),
              padding: EdgeInsets.all(10.0),
              width: 80.0,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.red, width: 2.0),
                    borderRadius: new BorderRadius.circular(5.0)
              )
            ),
            new Builder(builder: (ctx){
              return new InkWell(
                child: new Container(
                    child:  new Text("chat", style: new TextStyle(fontSize: 20.0)),
                    padding: EdgeInsets.all(10.0),
                    width: 80.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.red, width: 2.0),
                        borderRadius: new BorderRadius.circular(5.0)
                    )
                ),
                onTap: (){
                  gotoPage(context).then((value){
                    showDialog(context: ctx, builder: (ctx){
                       return new AlertDialog(
                         title: new Text("返回结果"),
                         content: new Text("你点击的索引：${value}"),
                         actions: <Widget>[
                           new FlatButton(onPressed: (){
                             Navigator.of(ctx).pop();
                           }, child: new Text("关闭"))
                         ],
                       );
                    });
                  });
                },
              );
            }),
            new GestureDetector(
              child: new Container(
                  child:  new Text("dialog", style: new TextStyle(fontSize: 20.0)),
                  padding: EdgeInsets.all(10.0),
                  width: 80.0,
                  margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.red, width: 2.0),
                      borderRadius: new BorderRadius.circular(5.0)
                  )
              ),
              onTap: (){
                showDialog(context: context, builder: (ctx){
                  return new AlertDialog(
                    title: new Text("提示"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset('images/881649.jpg'),
                        new Text('田野')
                      ],
                    ),
                    actions: <Widget>[
                      new FlatButton(onPressed: (){
                        print("click ok");
                        Navigator.of(context).pop();
                      }, child: new Text("确定")),
                      new FlatButton(onPressed: (){
                          Navigator.of(context).pop();
                      }, child: new Text("取消"))
                    ],
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
