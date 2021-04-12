import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:learn_colors/color-tile.dart';

class LearnColorsGame extends Game{
  List<ColorTile> colorTiles = new List<ColorTile>();
  Size screenSize;
  double tileSize;
  Rect testRect;
  Rect bgRect;
  final int yellow = 0xffffEB3B;
  final int green = 0xff4caf50;
  final int blue = 0xff2196f3;
  final int red = 0xffd32f2f;
  final int orange = 0xffff9800;
  final int purple = 0xff9c27b0;
  final int grey = 0xff9e9e9e;
  final int pink = 0xffe91e63;
  final int black = 0xff000000;

  LearnColorsGame(){
    init();
  }

  init() async{
    resize(await Flame.util.initialDimensions());
    bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    double fst = tileSize / 4;
    double sec = tileSize + (tileSize /2);
    double thr = (tileSize * 2 ) + (tileSize * .75);
    colorTiles.add(new ColorTile(new Offset(fst, fst), yellow, tileSize));
    colorTiles.add(new ColorTile(new Offset(sec, fst), green, tileSize));
    colorTiles.add(new ColorTile(new Offset(thr, fst), blue, tileSize));
    colorTiles.add(new ColorTile(new Offset(fst, sec), red, tileSize));
    colorTiles.add(new ColorTile(new Offset(sec, sec), orange, tileSize));
    colorTiles.add(new ColorTile(new Offset(thr, sec), purple, tileSize));
    colorTiles.add(new ColorTile(new Offset(fst, thr), grey, tileSize));
    colorTiles.add(new ColorTile(new Offset(sec, thr), pink, tileSize));
    colorTiles.add(new ColorTile(new Offset(thr, thr), black, tileSize));
  }

  @override
  void render(Canvas canvas) {
    Paint bgPaint = Paint();
    bgPaint.color = Colors.white;
    Paint testPaint = Paint();
    testPaint.color = Color(0xff00ff00);
    canvas.drawRect(bgRect, bgPaint);
    //canvas.drawRect(testRect, testPaint);
    colorTiles.forEach((ColorTile tile) {
      tile.render(canvas);
    });
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width / 4;
  }
  void onTapDown(TapDownDetails d){
    colorTiles.forEach((ColorTile tile) {
      if(tile.tileRect.contains(d.globalPosition)){
        tile.onTapDown();
      }
    });
  }
}