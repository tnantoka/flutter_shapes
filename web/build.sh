#!/bin/sh

cp -r ../lib/ ./lib/lib
cp -r ../example/lib/ ./lib/example

find lib/lib/*.dart | xargs sed -i "" -e "s/dart:ui/package:flutter_web_ui\/ui.dart/g"
find lib/example/*.dart | xargs sed -i "" -e "s/flutter\/materia/flutter_web\/materia/g"
find lib/example/*.dart | xargs sed -i "" -e "s/package:flutter_shapes/..\/lib/g"

rm -rf ../docs/
cp -r build ../docs
