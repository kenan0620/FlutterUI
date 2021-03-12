
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';


class ImageNetVC extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    var title = 'Image Net Show';
    
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

class ImageLocalVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var title = 'Image Local Show';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator(),),
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                  image: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg'),
            )
          ],
        ),
      ),
    );
  }
}

class ImageCacheVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child: new CachedNetworkImage(
            // placeholder: new CircularProgressIndicator(), 待处理
            imageUrl:
            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=121352583,3553479540&fm=26&gp=0.jpg',
          ),
        ),
      ),
    );
  }
}