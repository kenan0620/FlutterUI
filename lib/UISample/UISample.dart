import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UISampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     title: '在Flutter中构建布局',
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text('布局'),
       ),
       body: new Image.asset('Image/11.jpeg',
       height: 200,
       fit: BoxFit.cover,),
     ),
   );
  }
}
