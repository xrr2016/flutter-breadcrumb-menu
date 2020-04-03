import 'package:flutter/material.dart';

class FrontEnd extends StatelessWidget {
  static final String routeName = '/front-end';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('大前端组')),
    );
  }
}
