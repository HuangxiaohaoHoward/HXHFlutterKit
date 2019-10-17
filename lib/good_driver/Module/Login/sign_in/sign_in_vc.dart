import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInVC extends StatefulWidget {
  @override
  SignInVCState createState() => SignInVCState();
}

class SignInVCState extends State<SignInVC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: Image.asset('lib/images/3.0x/login_bg.png'),
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
