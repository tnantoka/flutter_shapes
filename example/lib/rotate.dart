import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

class RotatePage extends StatefulWidget {
  @override
  _RotatePageState createState() => _RotatePageState();
}

class _RotatePageState extends State<RotatePage> {
  double angle = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 30), (Timer timer) {
      setState(() {
        angle = angle + 1 % 360;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _MyPainter(angle: angle * pi / 180),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter({required this.angle}) : super();

  double angle;

  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return oldDelegate.angle != angle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final List<List<dynamic>> items = <List<dynamic>>[
      <dynamic>[Offset(size.width * 0.4, size.height * 0.6), Colors.red, 30.0],
      <dynamic>[Offset(size.width * 0.5, size.height * 0.5), Colors.blue, 40.0],
      <dynamic>[
        Offset(size.width * 0.6, size.height * 0.4),
        Colors.green,
        50.0
      ],
    ];

    for (List<dynamic> item in items) {
      final Color color = item[1];
      final Paint fill = Paint()
        ..color = color.withOpacity(0.7)
        ..style = PaintingStyle.fill;
      Shapes(canvas: canvas)
        ..paint = fill
        ..radius = item[2]
        ..center = item[0]
        ..angle = angle
        ..drawType(ShapeType.RoundedRect);
    }
  }
}
