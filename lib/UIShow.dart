
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageVC extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    var title = 'Image Show';
    
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs10.sinaimg.cn%2Fbmiddle%2F4c3e5da7t69ed9e19c229%26690&refer=http%3A%2F%2Fs10.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618048100&t=0d1a27a08dc1892ae3adfb918782dfe3'),
      ),
    );
  }
}
