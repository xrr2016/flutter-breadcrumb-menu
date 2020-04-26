library flutter_breadcrumb_menu;

import 'package:flutter/material.dart';

class Bread<T> {
  final T route;
  final arguments;
  final String label;

  Bread({@required this.label, this.route, this.arguments});
}

class Breadcrumb<T> extends StatelessWidget {
  final Color color;
  final double height;
  final Widget separator;
  final ValueChanged<T> onValueChanged;
  final List<Bread<T>> breads;

  const Breadcrumb({
    this.height = 40.0,
    this.color = Colors.blue,
    this.separator = const Icon(
      Icons.arrow_forward_ios,
      size: 12.0,
    ),
    this.onValueChanged,
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
              Color _color = isLast ? Colors.grey : color;

              return InkWell(
                onTap: () {
                  if (isLast) {
                    return;
                  }
                  final route = bread.route;
                  final arguments = bread.arguments;
                  if (this.onValueChanged!=null){
                    this.onValueChanged(route);
                  }
                  else {
                    if (route is String) {
                      Navigator.of(context).pushNamed(
                        route,
                        arguments: arguments,
                      );
                    } else if (route is PageRoute) {
                      Navigator.of(context).push(route);
                    }
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
