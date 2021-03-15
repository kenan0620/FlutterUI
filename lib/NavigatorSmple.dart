
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

class Todo {
  final String title;
  final String description;

  Todo(this.title,this.description);
}

class TodoListVC extends StatelessWidget {
  final List<Todo> todos;

  TodoListVC({Key key, this.todos}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = '给新页面传值';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(todos[index].title),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(
                builder: (context) => new DetailVC(todo: todos[index]),
              )
              );
            },
          );
        },
        itemCount: todos.length,),
      ),
    );
  }
}


class DetailVC extends StatelessWidget {
  final Todo todo;

  DetailVC({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Center(
          child: new Text('传过来的内容是：${todo.title}'),
        ),
      ),
    );
  }
}