import 'dart:math';
import 'package:flutter_web/material.dart';
import '../lib/flutter_shapes.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _sizeAnimationController;
  AnimationController _sparkleAnimationController;
  CurvedAnimation _sparkleAnimation;
  Random _random;
  double _randomValue = 0;

  @override
  void initState() {
    super.initState();

    _sizeAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _sizeAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _sizeAnimationController.reverse();
      }
    });
    _sizeAnimationController.addListener(() {
      setState(() {});
    });

    _sparkleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _sparkleAnimation = CurvedAnimation(
        parent: _sparkleAnimationController, curve: Curves.easeIn);
    _sparkleAnimation.addListener(() {
      setState(() {});
    });

    _random = Random();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: CustomPaint(
              painter: _MyPainter(
                  sizeRatio: _sizeAnimationController.value,
                  sparkleRatio: _sparkleAnimation.value,
                  sparkleBaseAngle: _randomValue * 50)),
        ),
        onTap: () {
          _sizeAnimationController.forward(from: 0);
          _sparkleAnimationController.forward(from: 0);
          _randomValue = _random.nextDouble();
        });
  }
}

Random random = Random();

class _MyPainter extends CustomPainter {
  _MyPainter({this.sizeRatio, this.sparkleRatio, this.sparkleBaseAngle})
      : super();

  double sizeRatio;
  double sparkleRatio;
  double sparkleBaseAngle;

  @override
  bool shouldRepaint(_MyPainter oldDelegate) {
    return oldDelegate.sizeRatio != sizeRatio ||
        oldDelegate.sparkleRatio != sparkleRatio ||
        oldDelegate.sparkleBaseAngle != sparkleBaseAngle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width * 0.5, size.height * 0.5);

    final Paint heartPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;

    Shapes(canvas: canvas)
      ..paint = heartPaint
      ..radius = 50 + sizeRatio * 20
      ..center = center
      ..drawType(ShapeType.Heart);

    if (sizeRatio == 0) {
      return;
    }

    final double sparkleRadius = 40 + 50 * sparkleRatio;
    final Paint starPaint = Paint()
      ..color = Colors.yellow[700].withOpacity(1 - sparkleRatio)
      ..style = PaintingStyle.fill;

    const int sparkleNum = 5;
    for (int i = 0; i < sparkleNum; i++) {
      final double angle = (sparkleBaseAngle + 360 / sparkleNum * i) * pi / 180;

      Shapes(canvas: canvas)
        ..paint = starPaint
        ..radius = 20
        ..center = center.translate(
            sparkleRadius * cos(angle), sparkleRadius * sin(angle))
        ..drawType(ShapeType.Star5);
    }
  }
}
