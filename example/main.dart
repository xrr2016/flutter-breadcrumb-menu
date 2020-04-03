import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb_menu/flutter_breadcrumb_menu.dart';

import 'cold_stone.dart';
import 'dev.dart';
import 'flutter_dev.dart';
import 'front_end.dart';

void main() => runApp(MyApp());

List<Bread> breads = [
  Bread(label: "冷石科技有限公司 ", route: ColdStone.routeName),
  Bread(label: "研发部", route: Dev.routeName),
  Bread(label: "大前端组", route: FrontEnd.routeName),
  Bread(label: "Flutter 开发", route: FlutterDev.routeName),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breadcrumb App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Breadcrumb Demo'),
        ),
        body: Center(
          child: Breadcrumb(breads: breads),
        ),
      ),
      routes: {
        ColdStone.routeName: (_) => ColdStone(),
        Dev.routeName: (_) => Dev(),
        FrontEnd.routeName: (_) => FrontEnd(),
        FlutterDev.routeName: (_) => FlutterDev(),
      },
    );
  }
}
