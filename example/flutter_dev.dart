import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class FlutterDev extends StatelessWidget {
  static final String routeName = '/flutter-dev';

  get breads => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Breadcrumb(breads: breads),
          SizedBox(
            height: 300.0,
          ),
          Center(child: Text('Flutter 应用开发')),
        ],
      ),
    );
  }
}
