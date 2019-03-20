import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_shapes/flutter_shapes.dart';

void main() {
  test('initializes with default values', () {
    final Shapes shapes = Shapes();
    expect(shapes.radius, 1);
  });
}
