import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

import '../example/cold_stone.dart';
import '../example/dev.dart';
import '../example/flutter_dev.dart';
import '../example/front_end.dart';

List<Bread> breads = [
  Bread(label: "冷石科技有限公司", route: ColdStone.routeName),
  Bread(label: "研发部", route: Dev.routeName),
  Bread(label: "大前端组", route: FrontEnd.routeName),
  Bread(label: "Flutter 开发", route: FlutterDev.routeName),
];

MaterialApp myApp = MaterialApp(
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

void main() {
  testWidgets('Render breads', (WidgetTester tester) async {
    await tester.pumpWidget(myApp);

    expect(find.text('冷石科技有限公司'), findsOneWidget);
    expect(find.text('研发部'), findsOneWidget);
    expect(find.text('Flutter 开发'), findsOneWidget);
    expect(find.text('大前端组'), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(ListView), findsWidgets);
    expect(find.byType(Icon), findsWidgets);
  });
}
