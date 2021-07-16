import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

class TypesPage extends StatefulWidget {
  @override
  _TypesPageState createState() => _TypesPageState();
}

class _TypesPageState extends State<TypesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: CustomPaint(painter: _MyPainter()),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint stroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final Paint fill = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.fill;
    const double radius = 40;
    final Shapes shapes = Shapes(canvas: canvas);
    for (String type in Shapes.types) {
      final int index = Shapes.types.indexOf(type);
      final double x =
          radius * 0.5 + radius * 2.9 * (index / 5).floor().toDouble();
      final double y = radius * 0.5 + radius * 2.5 * (index % 5).toDouble();
      for (Paint paint in <Paint>[stroke, fill]) {
        (shapes
              ..paint = paint
              ..radius = radius
              ..center = Offset(x, y))
            .draw(type);
      }
    }
  }
}
