import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SignInVC extends StatefulWidget {
  @override
  SignInVCState createState() => SignInVCState();
}

class SignInVCState extends State<SignInVC> {
//  Size size = MediaQuery.of(context).size;
//  Double width = size.width;
  _getWH() {
    var www = window.physicalSize;
    print(www.toString() + '\n' '${window.devicePixelRatio}');
  }

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
//        padding: EdgeInsets.all(10),

        child: Stack(

          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              child: Image.asset(
                'lib/images/3.0x/login_bg.png',

                ///如何填充
                fit: BoxFit.cover,
                height: double.infinity,

                ///重复显示
//          repeat: ImageRepeat.repeatX,
              ),
            ),
            ListView(
              primary: false,
              physics: ClampingScrollPhysics(

              ),
              children: <Widget>[

                Container(

//              alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20),
                  child: Text('测试'),
                  height: 400,
                  color: Colors.red,
                ),

                Container(

//              alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20),
                  child: Text('测试'),
                  height: 400,
                  color: Colors.lightGreen,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('登录'),

      ///居中，默认是自适应
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            print('星星 iconBtn');
            print('${MediaQuery.of(context).size}');
            _getWH();

            print('global key : ${globalKey.currentContext.size}');

            print(
                'MediaQuery.of(context).padding.top : ${MediaQuery.of(context).padding.top}');
          },
        ),
        FlatButton(
          child: Text(
            '点击注册',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            print('跳去注册');
          },
        )
      ],
    );
  }
}
