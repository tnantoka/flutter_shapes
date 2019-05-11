# Demo with flutter_web

## Prepare codes

```
cp -r ../lib/ ./lib/lib
cp -r ../example/lib/ ./lib/example

find lib/lib/*.dart | xargs sed -i "" -e "s/dart:ui/package:flutter_web_ui\/ui.dart/g"
find lib/example/*.dart | xargs sed -i "" -e "s/flutter\/material/flutter_web\/material/g"
find lib/example/*.dart | xargs sed -i "" -e "s/package:flutter_shapes/..\/lib/g"
```

## Publish

```
webdev build
mv ./build ../docs
```
