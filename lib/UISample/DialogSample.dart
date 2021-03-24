import 'package:flutter/material.dart';
import 'package:flutterui/UISample/UIAdapt.dart';

class Khfh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new GestureDetector(onTap: () {
        showDialogs(
            context,
            BaseDialog(
              title: "tishi",
              content: 'suibian',
            ));
      }),
    );
  }
}

class LTMDialog extends Dialog {
  LTMDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 0, top: 100, right: 0, bottom: 0),
      child: new Material(
        child: new Container(
          width: Adapt.screenWidth(),
          height: Adapt.screenHeight(),
          color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text('data'),
              new Text('data11'),
              new ElevatedButton(onPressed: () {}, child: new Text("按钮")),
            ],
          ),
        ),
      ),
    );
  }
}

class BaseDialog extends StatefulWidget {
  final String title;
  final String content;
  final bool cancelAble;
  final Function confirmCallback; // 点击确定按钮回调
  final Function cancelCallback; // 点击取消按钮
  final Function dismissCallback; // 弹窗关闭回调

  BaseDialog(
      {this.title = "",
      this.content = "",
      this.cancelAble = true,
      this.confirmCallback,
      this.cancelCallback,
      this.dismissCallback});

  @override
  _BaseDialogState createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog> {
  @override
  Widget build(BuildContext context) {
    var _dialogWidth = MediaQuery.of(context).size.width;

    // 构建弹框内容
    Container _dialogContent = Container(
      decoration: ShapeDecoration(
        color: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
      ),
      child: new Container(),
    );

    // 构建弹框布局
    return WillPopScope(
        child: GestureDetector(
          // onTap: () => {widget.cancelAble ? _dismissDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: new Container(
              padding: new EdgeInsets.only(top: Adapt.padTopHeight() + 44),
              child: SizedBox(
                width: Adapt.screenWidth(),
                height: Adapt.screenHeight() - Adapt.padTopHeight() - 44,
                child: _dialogContent,
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.cancelAble;
        });
  }

  /// 点击隐藏dialog
  _dismissDialog() {
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.of(context).pop();
  }

  /// 点击取消
  void _clickCancel() {
    if (widget.confirmCallback != null) {
      widget.confirmCallback();
    }
    _dismissDialog();
  }

  /// 点击确定
  void _clickConfirm() {
    if (widget.confirmCallback != null) {
      widget.confirmCallback();
    }
    _dismissDialog();
  }
}

/// 展示dialog
void showDialogs(BuildContext context, Widget dialog) {
// 导航到新路由 背景颜色为透明色
/*Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return dialog;
      }));*/
  showDialog(context: context, builder: (_) => dialog);
}
