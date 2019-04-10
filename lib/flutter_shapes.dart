library flutter_shapes;

import 'dart:math';
import 'dart:ui';

double radians(double degree) {
  return degree * pi / 180;
}

class Shapes {
  Shapes({this.canvas, this.paint, this.radius, this.center, this.angle});

  static List<String> types = ShapeTypes.values
      .map((ShapeTypes type) => type.toString().split('.')[1])
      .toList();

  Canvas canvas;
  Paint paint = Paint();
  double radius = 1;
  Offset center = Offset.zero;
  double angle = 0;

  Rect rect() => Rect.fromCircle(center: Offset.zero, radius: radius);

  void drawCircle() {
    rotate(() {
      canvas.drawCircle(Offset.zero, radius, paint);
    });
  }

  void drawRect() {
    rotate(() {
      canvas.drawRect(rect(), paint);
    });
  }

  void drawRRect({double cornerRadius}) {
    rotate(() {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              rect(), Radius.circular(cornerRadius ?? radius * 0.2)),
          paint);
    });
  }

  void drawPolygon(int num, {double initialAngle = 0}) {
    rotate(() {
      final Path path = Path();
      for (int i = 0; i < num; i++) {
        final double radian = radians(initialAngle + 360 / num * i.toDouble());
        final double x = radius * cos(radian);
        final double y = radius * sin(radian);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    });
  }

  void drawHeart() {
    rotate(() {
      final Path path = Path();

      path.moveTo(0, radius);

      path.cubicTo(-radius * 2, -radius * 0.5, -radius * 0.5, -radius * 1.5, 0,
          -radius * 0.5);
      path.cubicTo(
          radius * 0.5, -radius * 1.5, radius * 2, -radius * 0.5, 0, radius);

      canvas.drawPath(path, paint);
    });
  }

  void drawStar(int num, {double initialAngle = 0}) {
    rotate(() {
      final Path path = Path();
      for (int i = 0; i < num; i++) {
        final double radian = radians(initialAngle + 360 / num * i.toDouble());
        final double x = radius * (i.isEven ? 0.5 : 1) * cos(radian);
        final double y = radius * (i.isEven ? 0.5 : 1) * sin(radian);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, paint);
    });
  }

  void drawType(ShapeTypes type) {
    switch (type) {
      case ShapeTypes.Circle:
        drawCircle();
        break;
      case ShapeTypes.Rect:
        drawRect();
        break;
      case ShapeTypes.RoundedRect:
        drawRRect();
        break;
      case ShapeTypes.Triangle:
        drawPolygon(3, initialAngle: 30);
        break;
      case ShapeTypes.Diamond:
        drawPolygon(4, initialAngle: 0);
        break;
      case ShapeTypes.Pentagon:
        drawPolygon(5, initialAngle: -18);
        break;
      case ShapeTypes.Hexagon:
        drawPolygon(6, initialAngle: 0);
        break;
      case ShapeTypes.Octagon:
        drawPolygon(8, initialAngle: 0);
        break;
      case ShapeTypes.Decagon:
        drawPolygon(10, initialAngle: 0);
        break;
      case ShapeTypes.Dodecagon:
        drawPolygon(12, initialAngle: 0);
        break;
      case ShapeTypes.Heart:
        drawHeart();
        break;
      case ShapeTypes.Star5:
        drawStar(10, initialAngle: 15);
        break;
      case ShapeTypes.Star6:
        drawStar(12, initialAngle: 0);
        break;
      case ShapeTypes.Star7:
        drawStar(14, initialAngle: 0);
        break;
      case ShapeTypes.Star8:
        drawStar(16, initialAngle: 0);
        break;
    }
  }

  void draw(String typeString) {
    final ShapeTypes type = ShapeTypes.values.firstWhere(
        (ShapeTypes t) => t.toString() == 'ShapeTypes.$typeString',
        orElse: () => ShapeTypes.Circle);
    drawType(type);
  }

  void rotate(VoidCallback callback) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    callback();
    canvas.restore();
  }
}

enum ShapeTypes {
  Circle,
  Rect,
  RoundedRect,
  Triangle,
  Diamond,
  Pentagon,
  Hexagon,
  Octagon,
  Decagon,
  Dodecagon,
  Heart,
  Star5,
  Star6,
  Star7,
  Star8,
}
