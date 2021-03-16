import 'package:flutter/material.dart';

class OftenUIApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '常用控件',
      home: new ListVC(),
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