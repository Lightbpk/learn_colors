import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:learn_colors/learn-colors.dart';

void main() async{
  TapGestureRecognizer tapper =  new TapGestureRecognizer();
  LearnColorsGame game = new LearnColorsGame();
  Util flameUtil = new Util();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
}