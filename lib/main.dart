import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: WhiteContainer(),
    debugShowCheckedModeBanner: false,
  ));
}

class WhiteContainer extends StatefulWidget {
  @override
  State<WhiteContainer> createState() => _WhiteContainer();
}

class _WhiteContainer extends State<WhiteContainer> {
  _WhiteContainer();
  void initState() {
    int a = 5;
  }

  List<Widget> tiles = [
    ColorToContainer(key: UniqueKey()),
    ColorToContainer(key: UniqueKey()),
  ];
  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: swapTiles,
          ),
        ],
      ),
    );
  }
}

class ColorToContainer extends StatefulWidget {
  ColorToContainer({Key? key}) : super(key: key);
  @override
  State<ColorToContainer> createState() => _ColorToContainer();
}

class _ColorToContainer extends State<ColorToContainer> {
  _ColorToContainer();
  Color myColor = GetColor.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      width: 140,
      height: 100,
    );
  }
}

class GetColor {
  GetColor();
  static getColor() {
    return Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
        Random().nextInt(256), 1.0);
  }
}
