
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

class ListLongViewVC extends StatelessWidget {
  final List<String> items;
  ListLongViewVC({Key,key,
  @required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '长列表';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(itemCount: items.length,itemBuilder: (context, index) {
          return new ListTile(
            title: new Text('数据源 ${items[index]} 来了'),
          );
        }),
      ),
    );
  }
}

class ListWorkVC extends StatelessWidget {
  final List<ListItem> items;
  ListWorkVC({Key,key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '工作数据';
    // TODO: implement build
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(itemBuilder: (context, index){
          final item = items[index];
          if (item is HeadingItem) {
            return new ListTile(
              title: new Text(item.heading,
              style: Theme.of(context).textTheme.headline,),
            );
          }else if (item is MessageItem) {
            return new ListTile(
              title: new Text(item.sender),
              subtitle: new Text(item.body),
            );
          }
        }, itemCount: items.length,),
      ),
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
