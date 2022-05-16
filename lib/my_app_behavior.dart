import 'package:flutter/animation.dart';

mixin MyAppBehavior {
  Animation animation;
  AnimationController controller;
  double height = 100, x = 0, y = 0;
  bool isRedVisible = true;
  bool isBlueVisible = true;
  bool isYellowVisible = true;
  bool isGreenVisible = true;

  bool isRedVisiblePanX = true;
  bool isBlueVisiblePanX = true;
  bool isYellowVisiblePanX = true;
  bool isGreenVisiblePanX = true;

  bool isRedVisiblePanY = true;
  bool isBlueVisiblePanY = true;
  bool isYellowVisiblePanY = true;
  bool isGreenVisiblePanY = true;
}