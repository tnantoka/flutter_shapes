import 'package:flutter/material.dart';
import 'package:flutter_shapes/flutter_shapes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shapes Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Shapes Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: CustomPaint(painter: MyPainter()),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint stroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    Paint fill = Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.fill;
    double radius = 40;
    Shapes shapes = Shapes(canvas: canvas);
    Shapes.types.forEach((type) {
      int index = Shapes.types.indexOf(type);
      double x = radius * 0.5 + radius * 2.7 * (index / 5).floor().toDouble();
      double y = radius * 0.5 + radius * 2.7 * (index % 5).toDouble();
      [stroke, fill].forEach((paint) {
        (shapes
              ..paint = paint
              ..radius = radius
              ..center = Offset(x, y))
            .draw(type);
      });
    });
  }
}
