
import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '导航',
      home: new FirstVC(),
    );
  }
}

class FirstVC extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FirstVC'),
      ),
      body: new Center(
        child: new ElevatedButton(onPressed: () {
          // Navigate to second screen when tapped!
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondVC()),);
        }, child: new Text('Launch new screen')),
      ),
    );
  }
}

class SecondVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SecondVC'),
      ),
      body: new Center(
        child: new ElevatedButton(onPressed: () {
          // Navigate back to First screen when tapped!
          Navigator.pop(context);
        }, child: new Text('go back')),
      ),
    );
  }
}