import 'package:flutter/material.dart';

class Dev extends StatelessWidget {
  static final String routeName = '/dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('研发部')),
    );
  }
}
