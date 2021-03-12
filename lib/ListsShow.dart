
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewVC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = 'ListView Show';

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo),
              title: new Text("Photo"),
            ),
            new ListTile(
              leading: new Icon(Icons.print),
              title: new Text('Print'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListRowViewVC extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final title = '水平list';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          height: 200,
          child: new ListView(
          scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                width: 160,
                color: Colors.red,
              ),
              new Container(
                width: 160,
                color: Colors.tealAccent,
              ),
              new Container(
                width: 160,
                color: Colors.deepPurpleAccent,
              ),
              new Container(
                width: 160.0,
                color: Colors.green,
              ),
              new Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              new Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );

  }
}