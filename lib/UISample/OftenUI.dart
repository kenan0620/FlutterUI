import 'package:flutter/material.dart';
import 'package:flutterui/UISample/UIAdapt.dart';

class OftenUIApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '常用控件',
      home: new StackVC(),
    );
  }
}

class GridVC extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    
    List<Container> _buildGridTileList(int count) {
      return new List<Container>.generate(count, (index) => new Container(
        child: new Image.asset('Image/11.jpeg'),
      ));
    }

    Widget buildGrid() {
      return new GridView.extent(maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30),);
    }
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常用控件示例'),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}

class ListVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      new ListTile(
        title: new Text('CineArts at the Empire',
        style: new TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),),
        subtitle: new Text('85 W Prtal Ave'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('CineArts at the Empire',
          style: new TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),),
        subtitle: new Text('85 W Prtal Ave'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('CineArts at the Empire',
          style: new TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),),
        subtitle: new Text('85 W Prtal Ave'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常用控件示例'),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}

class StackVC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var stack = new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('Image/11.jpeg'),
          radius: Adapt.screenWidth()/6,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text('Mia B',
          style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        )
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('常用控件示例'),
      ),
      body: stack,
    );
  }
}


class CardVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var card = new SizedBox(
      height: 210,
      child: new Card(
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 主街道',
              style: new TextStyle(
                fontWeight: FontWeight.w500
              ),),
              subtitle: new Text('加利福尼亚 99984'),
              leading: new Icon(Icons.restaurant_menu,
              color: Colors.blue[500],),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 55-1222',
              style: new TextStyle(
                fontWeight: FontWeight.w500
              ),),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            )
          ],
        ),
      ),
    );

    return new MaterialApp(
      title: 'Card Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Card Demo'),
        ),
        body: card,
      ),
    );
  }
}

class ListTileVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'ListTile Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListTile Demo'),
        ),
        body: new ListTile(
          title: new Text('ListTile',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50
          ),),
        ),
      ),
    );
  }
}