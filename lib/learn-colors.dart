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
  final int blue = 0xff01579b;
  final int lightBlue = 0xff29b6f6;
  final int red = 0xffd32f2f;
  final int orange = 0xffff9800;
  final int purple = 0xff9c27b0;
  final int grey = 0xff9e9e9e;
  final int pink = 0xffe91e63;
  final int black = 0xff000000;
  final int brown = 0xff4e342e;
  final int white = 0xffffffff;

  LearnColorsGame(){
    init();
  }

  init() async{
    resize(await Flame.util.initialDimensions());
    bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    double fst = tileSize / 4;
    double sec = tileSize + (tileSize /2);
    double thr = (tileSize * 2 ) + (tileSize * .75);
    double fore = (tileSize * 4);
    colorTiles.add(new ColorTile(new Offset(fst, fst), yellow, tileSize,'audio/yellow.m4a'));
    colorTiles.add(new ColorTile(new Offset(sec, fst), green, tileSize,'audio/green.m4a'));
    colorTiles.add(new ColorTile(new Offset(thr, fst), blue, tileSize,'audio/blue.m4a'));
    colorTiles.add(new ColorTile(new Offset(fst, sec), red, tileSize,'audio/red.m4a'));
    colorTiles.add(new ColorTile(new Offset(sec, sec), orange, tileSize,'audio/orange.m4a'));
    colorTiles.add(new ColorTile(new Offset(thr, sec), purple, tileSize,'audio/purple.m4a'));
    colorTiles.add(new ColorTile(new Offset(fst, thr), grey, tileSize,'audio/grey.m4a'));
    colorTiles.add(new ColorTile(new Offset(sec, thr), pink, tileSize,'audio/pink.m4a'));
    colorTiles.add(new ColorTile(new Offset(thr, thr), black, tileSize,'audio/black.m4a'));
    colorTiles.add(new ColorTile(new Offset(fst, fore), brown, tileSize,'audio/brown.m4a'));
    colorTiles.add(new ColorTile(new Offset(sec, fore), lightBlue, tileSize,'audio/lightblue.m4a'));
    colorTiles.add(new ColorTile(new Offset(thr, fore), white, tileSize,'audio/white.m4a'));
  }

  @override
  void render(Canvas canvas) {
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xb3ffffff);
    canvas.drawRect(bgRect, bgPaint);
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