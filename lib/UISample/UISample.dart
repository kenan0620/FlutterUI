import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UIAdapt.dart';

class UISampleApp extends StatelessWidget {
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
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
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
