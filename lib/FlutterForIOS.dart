import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FluterIOSAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter For IOS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('绘图'),
        ),
        body: DrawPicture(),
      ),
    );
  }
}

class UpdateWidgetVC extends StatefulWidget {
  UpdateWidgetVC({Key key}) : super(key: key);

  _UpdateWidgetVCState createState() => new _UpdateWidgetVCState();
}

class _UpdateWidgetVCState extends State<UpdateWidgetVC> {
  String textToShow = 'I Like Flutter';
  int count = 1;
  void request() {
    setState(() {
      count++;
      textToShow = 'Flutter is Awesome $count';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Update Widget Data'),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: () {},
          child: Text('hello'),
          color: Colors.yellow,
          padding: EdgeInsets.only(left: 40, right: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: request,
        tooltip: 'Update Data',
        child: new Icon(Icons.update),
      ),
    );
  }
}

class WidgetManager extends StatefulWidget {
  WidgetManager({Key key}) : super(key: key);
  _WidgetManagerState createState() => new _WidgetManagerState();
}

class _WidgetManagerState extends State<WidgetManager> {
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
          child: Text('Toggle Two'),
          onPressed: () {
            print("第二个来了");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('添加和删除视图'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}

class Animation extends StatefulWidget {
  Animation({Key key}) : super(key: key);

  _AnimationState createState() => new _AnimationState();
}

class _AnimationState extends State<Animation> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('动画'),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curvedAnimation,
            child: FlutterLogo(
              size: 100,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset> points;

  SignaturePainter(this.points);

  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 5;
    for (int i = 0; i < points.length - 1;  i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class DrawPicture extends StatefulWidget {
  _DrawPictureState createState() => new _DrawPictureState();
}

class _DrawPictureState extends State <DrawPicture> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox refereceBox = context.findRenderObject();
          Offset localPosition = refereceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details)  => _points.add(null),
      child: CustomPaint(painter: SignaturePainter(_points),size: Size.infinite,),
    );
  }
}