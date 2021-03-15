import 'package:flutter/material.dart';

import 'package:dio/dio.dart';


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
            child: new ElevatedButton(onPressed: () {
              network();
            }, child: new Text('Network Request')),
          ),),
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
