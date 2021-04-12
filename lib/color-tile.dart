import 'dart:ui';

import 'package:flutter/material.dart';

class ColorTile {
  Rect tileRect;
  Paint tilePaint;
  int intColor;

  ColorTile(Offset position, int intColor, double tileSize){
    tilePaint = new Paint();
    this.intColor = intColor;
    tilePaint.color = Color(intColor);
    tileRect = Rect.fromLTWH(position.dx, position.dy, tileSize , tileSize);
  }

  void render(Canvas canvas){
    canvas.drawRect(tileRect, tilePaint);
  }
  void onTapDown(){
    print('color code $intColor');
  }
}