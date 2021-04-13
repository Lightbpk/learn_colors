import 'dart:typed_data';
import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class ColorTile {
  Rect tileRect;
  Paint tilePaint;
  String soundPath;
  int intColor;
  AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  static AudioCache cache = AudioCache();

  ColorTile(Offset position, int intColor, double tileSize, String soundPath){
    tilePaint = new Paint();
    this.intColor = intColor;
    this.soundPath = soundPath;
    tilePaint.color = Color(intColor);
    tileRect = Rect.fromLTWH(position.dx, position.dy, tileSize , tileSize);
  }

  void render(Canvas canvas){
    canvas.drawRect(tileRect, tilePaint);
  }
  void onTapDown(){
    print('color code $intColor');
     playSoundColor();
  }
  void playSoundColor() async {
    player = await cache.play(soundPath);
   /* Soundpool pool = Soundpool(streamType: StreamType.notification);

    int soundId = await rootBundle.load("/audio/rainbow.m4a").then((ByteData soundData)
    {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);*/

  }
}