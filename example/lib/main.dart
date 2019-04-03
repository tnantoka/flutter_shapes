import 'package:flutter/material.dart';

import 'animation.dart';
import 'paint.dart';
import 'types.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shapes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: const <Widget>[
                Tab(text: 'Types'),
                Tab(text: 'Animation'),
                Tab(text: 'Paint'),
              ],
            ),
            title: const Text('Flutter Shapes Demo'),
          ),
          body: TabBarView(
            children: <Widget>[
              TypesPage(),
              AnimationPage(),
              PaintPage(),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
