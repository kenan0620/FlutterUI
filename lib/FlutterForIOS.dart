import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FluterIOSAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter For IOS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WidgetManager(),
    );
  }
}

class UpdateWidgetVC extends StatefulWidget{
  UpdateWidgetVC({Key key}) : super(key: key);

  _UpdateWidgetVCState createState() => new _UpdateWidgetVCState();
}

class _UpdateWidgetVCState extends State<UpdateWidgetVC> {
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
        title: new Text('Update Widget Data'),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: (){

          },
          child: Text('hello'),
          color: Colors.yellow,
          padding: EdgeInsets.only(left: 40,right: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: request,
      tooltip: 'Update Data',
      child: new Icon(Icons.update),),
    );
  }
}

class WidgetManager extends StatefulWidget {
  WidgetManager({Key key}): super(key: key);
  _WidgetManagerState createState() => new _WidgetManagerState();
}

class _WidgetManagerState extends State<WidgetManager>{
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    }else {
      return CupertinoButton(child: Text('Toggle Two'), onPressed: (){
        print("第二个来了");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('添加和删除视图'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}