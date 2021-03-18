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
      body: new Container(
        padding: EdgeInsets.only(left: 50,top: 50,right: 50,bottom: 50),
        color: Colors.yellow,
        child: new ElevatedButton(
            onPressed: () {
              // Navigate to second screen when tapped!
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondVC()),
              );
            },
            child: new Text('Launch new screen')),
        width: 200,
          height: 200,
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
        child: new ElevatedButton(
            onPressed: () {
              // Navigate back to First screen when tapped!
              Navigator.pop(context);
            },
            child: new Text('go back')),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodoListVC extends StatelessWidget {
  final List<Todo> todos;

  TodoListVC({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = '给新页面传值';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new DetailVC(todo: todos[index]),
                    ));
              },
            );
          },
          itemCount: todos.length,
        ),
      ),
    );
  }
}

class DetailVC extends StatelessWidget {
  final Todo todo;

  DetailVC({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

class HomePageVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Return Data Demo'),
      ),
      body: new Center(
        child: new SelectButton(),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ElevatedButton(
        onPressed: () {
          _navigationAndDisplaySelection(context);
        },
        child: new Text('Pick an option, any option!'));
  }

  _navigationAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SelectVC()),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text('$result')));
  }
}

class SelectVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Pick an option'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8),
              child: new ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yep!');
                  },
                  child: new Text('Yep!')),
            ),
            new Padding(
              padding: const EdgeInsets.all(8),
              child: new ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope.');
                  },
                  child: new Text('Nope')),
            )
          ],
        ),
      ),
    );
  }
}
