import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

class PaintPage extends StatefulWidget {
  @override
  _PaintPageState createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  List<Offset> positions = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: CustomPaint(
            painter: _MyPainter(positions: List<Offset>.from(positions))),
        color: Colors.black87,
      ),
      onPanUpdate: _onPanUpdate,
    );
  }

  void _onPanUpdate(DragUpdateDetails update) {
    final RenderBox renderBox = context.findRenderObject();
    final Offset position = renderBox.globalToLocal(update.globalPosition);
    if (positions.isNotEmpty &&
        (positions.last.dx - position.dx).abs() < 10 &&
        (positions.last.dy - position.dy).abs() < 10) {
      return;
    }
    if (positions.length > 50) {
      positions.removeAt(0);
    }
    setState(() {
      positions.add(position);
    });
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter({this.positions}) : super();

  List<Offset> positions;

  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return oldDelegate.positions.length != positions.length ||
        oldDelegate.positions[0] != positions[0];
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fill = Paint()
      ..color = Colors.yellow.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    for (Offset position in positions) {
      Shapes(canvas: canvas)
        ..paint = fill
        ..radius = 10
        ..center = position
        ..drawType(ShapeTypes.Star5);
    }
  }
}
