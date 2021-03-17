import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UIAdapt.dart';

class FavoriteWidget extends StatefulWidget {
  @override

  _FavoriteWidgetSate createState() => new _FavoriteWidgetSate();
}

class _FavoriteWidgetSate extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavrite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      }else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(icon: _isFavorited? new Icon(Icons.star) : Icon(Icons.star_border),
              color: Colors.red[500],
              onPressed: _toggleFavrite),
        ),
        new SizedBox(
          width: 18,
          child: new  Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class EventSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TitleSection
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
                /* enum CrossAxisAlignment {
                    //将子控件放在交叉轴的起始位置
                    start,

                    //将子控件放在交叉轴的结束位置
                    end,

                    //将子控件放在交叉轴的中间位置
                    center,

                    //使子控件填满交叉轴
                    stretch,

                    //将子控件放在交叉轴的上，并且与基线相匹配（不常用）
                    baseline,
                    }*/
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: new Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              )),
          new FavoriteWidget(),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        /**enum MainAxisAlignment {
            //将子控件放在主轴的开始位置
            start,
            //将子控件放在主轴的结束位置
            end,
            //将子控件放在主轴的中间位置
            center,
            //将主轴空白位置进行均分，排列子元素，手尾没有空隙
            spaceBetween,
            //将主轴空白区域均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件间距的一半
            spaceAround,
            //将主轴空白区域均分，使各个子控件间距相等
            spaceEvenly,
            }*/
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
       ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'Image/11.jpeg',
              width: Adapt.screenWidth(),
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapoxAState createState() => new _TapoxAState();
}

class _TapoxAState extends State<TapboxA> {
  bool _active = false;

  void _handeTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handeTap,
      child: new Container(
        child: new Center(
          child: new Text(_active? 'Active' : 'Inactive',
          style: new TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),),
        ),
        width:200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TaboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tapbox Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('TapboxC Demo'),
        ),
        body: new Center(
          child: new ParentWidget(),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}
class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new TapboxC(onChanged: _handleTapboxChanged,
      active: _active,),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged}): super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(active? 'Active':'Inactive',
          style: new TextStyle(fontSize: 32,color: Colors.white),),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key,this.active,@required this.onChanged}) : super(key: key);

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }
  
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active? 'Active' : 'Inactive',
          style: new TextStyle(fontSize: 32,color: Colors.white),),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight? new Border.all(color: Colors.teal[700],width: 10) : null,
        ),
      ),
    );
  }
}