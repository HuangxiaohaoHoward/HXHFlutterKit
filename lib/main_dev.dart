import 'package:flutter/material.dart';

import 'hxh_flutter_kit/http_util/hxh_http_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http utils',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'http utils Home Page'),
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
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('测试get'),
              onPressed: () {
//                http://192.168.0.24:8769/admin/v2.0/work/driverList?limit=123&page=1&username=1
                String path = 'http://192.168.0.24:8769/admin/v2'
                    '.0/work/driverList';
                Map param = {
                  'username': '18513500000',
                  'page': '1',
                  'limit': '999'
                };
                HXHHttpUtils().getRequest(path, param,
                    (int state, bool isSuccess, dynamic resp) {
                  print('state : ' +
                      state.toString() +
                      '\nresp : ' +
                      resp.toString());
                  this.setState(() {
                    _str = resp.toString();
                  });
                });
              },
            ),
            Text(
              _str,
            ),
          ],
        ),
      ),
    );
  }
}
