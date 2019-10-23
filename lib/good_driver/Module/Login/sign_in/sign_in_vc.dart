import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hxh_flutter_kit/good_driver/common/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInVC extends StatefulWidget {
  @override
  SignInVCState createState() => SignInVCState();
}

class SignInVCState extends State<SignInVC> {
  _getWH() {
    var www = window.physicalSize;
    print(www.toString() + '\n' '${window.devicePixelRatio}');
  }

  ///globalKey不好用。暂时先不用。
//  GlobalKey globalKey = GlobalKey();

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
                'images/sign_in/login_bg.png',

                ///如何填充
                fit: BoxFit.cover,
                height: double.infinity,

                ///重复显示
//          repeat: ImageRepeat.repeatX,
              ),
            ),
            ListView(
              primary: false,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Container(
//              alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Image.asset('images/sign_in/sign_in_sms.png'),
                  height: 400,
                  color: Colors.red,
                ),
                Container(
//              alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
//                  child: Text('测试'),
                  child: Image.asset(
                    'assets/sign_up_driver_head.png',
                    fit: BoxFit.contain,
                    height: double.infinity,
                  ),
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

//            print('global key : ${globalKey.currentContext.size}');

            print(
                'MediaQuery.of(context).padding.top : ${MediaQuery.of(context).padding.top}');
          },
        ),
        buildFlatButton()
      ],
    );
  }

  FlatButton buildFlatButton() {
    return FlatButton(
      child: Text(
        '点击注册',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _signinAction();
      },
    );
  }

  _signinAction() {
    print('跳去注册');
    debugPrint('debug 跳去注册');

    SharedPreferences prefs = SharedPreferences.getInstance();

    Constant.key_user;
  }
}
