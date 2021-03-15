import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DataModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  DataModel({this.userId, this.id, this.title, this.body});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return new DataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class NetworkVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '网络请求',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('网络请求页面'),
        ),
        body: new Center(
          child: new ElevatedButton(
              onPressed: () {
                network();
              },
              child: new Text('Network Request')),
        ),
      ),
    );
  }

  void network() async {
    try {
      //两种配置方式

      // Dio dio = Dio();
      // dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
      // dio.options.connectTimeout = 50000; //5s
      // dio.options.receiveTimeout = 30000; //30s

      BaseOptions options = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );

      Dio dio = Dio(options);

      Response response = await dio.get("/posts/1");
      print('返回的数据为：$response');
    } catch (error) {
      print('错误请求原因：$error');
    }
  }
}

class WebsocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket';
    return new MaterialApp(
      title: title,
      home: new WebsocketVC(
          title: title,
          channel: new IOWebSocketChannel.connect('ws://echo.websocket.org')),
    );
  }
}

class WebsocketVC extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  WebsocketVC({Key key, @required this.title, @required this.channel})
      : super(key: key);

  _WebsocketStateVC createState() => new _WebsocketStateVC();
}

class _WebsocketStateVC extends State<WebsocketVC> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            new StreamBuilder(
              builder: (context, snapshot) {
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
              stream: widget.channel.stream,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
