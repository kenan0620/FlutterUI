import 'package:flutter/material.dart';

class TapVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = 'Gesture 手势点击';

    return new MaterialApp(
      title: title,
      home: new TapHomeVC(title:title),
    );
  }
}

class TapHomeVC extends StatelessWidget{
  final String title;
  TapHomeVC({Key key, this.title}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: MyButton(),),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text('Tap'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(12),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(8)
        ),
        child: new Text('Button'),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap:() {
        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Tap'),));
      },
      child: new Container(
        padding: new EdgeInsets.all(12),
        child: new Text('Flat Button'),
      ),
    );
  }
}