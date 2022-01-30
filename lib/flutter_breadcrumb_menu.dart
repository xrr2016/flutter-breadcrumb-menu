library flutter_breadcrumb_menu;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Bread<T> {
  final T? route;
  final arguments;
  final String label;

  Bread({required this.label, this.route, this.arguments});
}

class Breadcrumb<T> extends StatelessWidget {
  final Color color;
  final double height;
  final Widget separator;
  final ValueChanged<T?>? onValueChanged;
  final List<Bread<T>> breads;

  /// Set this to true if in your usage you want to override that, and allow the last
  /// item to be clickable.
  /// In general, the last crumb is assumed to be current view and is not clickable.
  /// If you aren't showing the current item in the breadcrumb list, you probably
  /// want all breadcrumbs to be clickable.
  final bool isLastActive;

  const Breadcrumb({
    this.height = 40.0,
    this.color = Colors.blue,
    this.separator = const Icon(
      Icons.arrow_forward_ios,
      size: 12.0,
    ),
    this.onValueChanged,
    bool isLastActive = false,
    required this.breads,
  }) : isLastActive = isLastActive;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    final widget = Column(
      children: <Widget>[
        Container(
          height: height,
          child: ListView.separated(
            controller: controller,
            itemCount: breads.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext ctx, int index) {
              final bread = breads[index];
              bool isDisabled = bread == breads.last && !isLastActive;
              Color _color = isDisabled ? Colors.grey : color;

              return InkWell(
                onTap: () {
                  if (isDisabled) {
                    return;
                  }
                  final route = bread.route;
                  final arguments = bread.arguments;
                  if (this.onValueChanged != null) {
                    this.onValueChanged!(route);
                  } else {
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
        )
      ],
    );

    SchedulerBinding.instance!.addPostFrameCallback(
        (timeStamp) => controller.jumpTo(controller.position.maxScrollExtent));

    return widget;
  }
}
