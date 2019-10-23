import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hxh_flutter_kit/good_driver/NetworkManager/commonModels/sdg_cooperator_model.dart';
import 'package:hxh_flutter_kit/good_driver/common/constant/constant.dart';

///业务类
import 'good_driver/Module/Login/sign_in/sign_in_vc.dart';

///工具类
import 'good_driver/common/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hxh_flutter_kit/good_driver/NetworkManager/network_manager.dart';

Widget _rootVC;

void main() {
//  runApp(MyApp());
  getRootVC();
}

Future<Map> getUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map map = prefs.get(Constant.key_user);
  print(map.toString());
  return map;
}

///获取根控件
getRootVC() {
//  runApp(MyApp());

  Future<Map> map = getUserInfo();
  map.then((Map map) {
    if (map == null || map.isEmpty) {
      _rootVC = SignInVC();
    } else {
      _rootVC = MyHomePage(title: 'root vc');
    }
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http utils',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'good driver '),
      home: _rootVC,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _str = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('跳登录页'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignInVC();
                }));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('测试get'),
              onPressed: _testRequestAction,
            ),
            Text(
              _str,
            ),
          ],
        ),
      ),
    );
  }

  _testRequestAction() {
    this.setState(() {
      _str = '请求中';
    });
    Map param = {
      'username': '18513500000',
      'page': '1',
      'limit': '999',
    };
    SDGDataManager().getCooperation(param, (state, isSuccess, resp) {
      if (isSuccess) {
        for (var i = 0; i < resp.length; ++i) {
          SDGCooperatorModel model = resp[i];
          this.setState(() {
            _str = _str + '\n' + model.customerName;
          });
        }
      } else {
        this.setState(() {
          _str = resp.toString();
        });
      }
    });
  }
}
