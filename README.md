# FlutterShapes

![](https://github.com/tnantoka/flutter_shapes/raw/master/heart.gif)
![](https://github.com/tnantoka/flutter_shapes/raw/master/star.gif)
![](https://github.com/tnantoka/flutter_shapes/raw/master/rotate.gif)

[Live demo](https://tnantoka.github.io/flutter_shapes/) powered by [Flutter for web](https://github.com/flutter/flutter_web).

## Shape types

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
    Shapes shapes = Shapes(canvas: canvas, radius: 50, paint: paint, center: Offset.zero, angle: 0);

    shapes.drawCircle();                // method name
    shapes.drawType(ShapeType.Circle);  // enum
    shapes.draw('Circle');              // string
  }
}
```
## Acknowledgements

https://proandroiddev.com/flutter-animation-creating-mediums-clap-animation-in-flutter-3168f047421e

A great article about animation with Flutter.  
It helped me to write example codes.
