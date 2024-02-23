import 'package:flutter/material.dart';

Widget drawGridLines(
    {double space = 30, Color color = Colors.red, Widget? child}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      var h = Container(width: 0.5, height: height, color: Colors.white60);
      var v = Container(width: width, height: 0.5, color: Colors.white60);
      return Stack(children: <Widget>[
        ...List.generate((width / space).round(),
                (index) => Positioned(left: index * space, child: h)),
        ...List.generate((height / space).round(),
                (index) => Positioned(top: index * space, child: v)),
        if (child != null) child,
      ]);
    },
  );
}
