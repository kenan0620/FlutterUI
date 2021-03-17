import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FluterIOSAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter For IOS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlutterForIOSVC(),
    );
  }
}

class FlutterForIOSVC extends StatefulWidget{
  FlutterForIOSVC({Key key}) : super(key: key);

  _FlutterForIOSVCState createState() => new _FlutterForIOSVCState();
}

class _FlutterForIOSVCState extends State<FlutterForIOSVC> {
  String textToShow = 'I Like Flutter';
int count = 1;
  void request() {
    setState(() {
      count ++;
      textToShow = 'Flutter is Awesome $count';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter For IOS'),
      ),
      body: Center(
        child: Text(textToShow),
      ),
      floatingActionButton: FloatingActionButton(onPressed: request,
      tooltip: 'Update Data',
      child: new Icon(Icons.update),),
    );
  }
}