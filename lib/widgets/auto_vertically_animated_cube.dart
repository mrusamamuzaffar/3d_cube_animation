import 'package:flutter/material.dart';
import 'dart:math';
import 'cube_sides/blue_container.dart';
import 'cube_sides/green_container.dart';
import 'cube_sides/red_container.dart';
import 'cube_sides/yellow_container.dart';

class AutoVerticallyAnimatedCube extends StatelessWidget {
  const AutoVerticallyAnimatedCube({Key key,
    this.animation,
    this.height,
    this.isRedVisible,
    this.isBlueVisible,
    this.isYellowVisible,
    this.isGreenVisible}) : super(key: key);

  final Animation<double> animation;
  final bool isGreenVisible, isYellowVisible, isBlueVisible, isRedVisible;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: isGreenVisible,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, (cos(animation.value) * (height / 2)),
                  ((height / 2) * sin(animation.value)))
              ..rotateX((pi / 2) + animation.value),
            child: Container(
              child: Center(child: GreenContainer()),
            ),
          ),
        ),
        Visibility(
          visible: isYellowVisible,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -(sin(animation.value) * (height / 2)),
                  ((height / 2) * cos(animation.value)))
              ..rotateX((pi) + animation.value),
            child: Container(
              child: Center(child: YellowContainer()),
            ),
          ),
        ),
        Visibility(
          visible: isBlueVisible,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -(cos(animation.value) * (height / 2)),
                  (-(height / 2) * sin(animation.value)))
              ..rotateX(-(pi / 2) + animation.value),
            child: Container(
              child: Center(child: BlueContainer()),
            ),
          ),
        ),
        Visibility(
          visible: isRedVisible,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(
                0.0,
                (height / 2) * sin(animation.value),
                -((height / 2) * cos(animation.value)),
              )
              ..rotateX(animation.value),
            child: Container(
              child: Center(child: RedContainer()),
            ),
          ),
        ),
      ],
    );
  }
}
