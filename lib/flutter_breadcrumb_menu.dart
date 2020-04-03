library flutter_breadcrumb_menu;

import 'package:flutter/material.dart';

class Bread {
  final route;
  final arguments;
  final String label;

  Bread({@required this.label, this.route, this.arguments});
}

class Breadcrumb extends StatelessWidget {
  final Color color;
  final double height;
  final Widget separator;
  final List<Bread> breads;

  const Breadcrumb({
    this.height = 40.0,
    this.color = Colors.blue,
    this.separator = const Icon(
      Icons.arrow_forward_ios,
      size: 12.0,
    ),
    @required this.breads,
  }) : assert(breads != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: height,
          child: ListView.separated(
            itemCount: breads.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int index) {
              final bread = breads[index];
              bool isLast = bread == breads.last;
              Color _color =
                  isLast ? Theme.of(context).textTheme.bodyText1.color : color;

              return InkWell(
                onTap: () {
                  if (isLast) {
                    return;
                  }
                  final route = bread.route;
                  final arguments = bread.arguments;
                  if (route is String) {
                    Navigator.of(context).pushNamed(
                      route,
                      arguments: arguments,
                    );
                  } else if (route is PageRoute) {
                    Navigator.of(context).push(route);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bread.label,
                      style: TextStyle(color: _color),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext ctx, int index) => separator,
          ),
        ),
        Divider(),
      ],
    );
  }
}
