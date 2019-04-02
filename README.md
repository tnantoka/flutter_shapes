# FlutterShapes

![](https://github.com/tnantoka/flutter_shapes/raw/master/screenshot.png)

## Adding FlutterShapes to your project

```
dependencies:
  flutter:
    sdk: flutter
  flutter_shapes:
```

## Drawing a Shape

```
import 'package:flutter_shapes/flutter_shapes.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    Shapes shapes = Shapes(canvas: canvas, radius: 50, paint: paint, center: Offset.zero);

    shapes.drawCircle();                 // method name
    shapes.drawType(ShapeTypes.Circle);  // enum
    shapes.draw('Circle');               // string
  }
}
```
