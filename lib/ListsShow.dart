
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