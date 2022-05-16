import 'package:flutter/material.dart';
import 'dart:math';
import 'cube_sides/blue_container.dart';
import 'cube_sides/green_container.dart';
import 'cube_sides/red_container.dart';
import 'cube_sides/yellow_container.dart';

class ManualHorizontallyAnimatedCube extends StatefulWidget {
  const ManualHorizontallyAnimatedCube({Key key,
    this.animation,
    this.height,
    this.isRedVisible,
    this.isBlueVisible,
    this.isYellowVisible,
    this.isGreenVisible,
    this.isRedVisiblePanX,
    this.isBlueVisiblePanX,
    this.isYellowVisiblePanX,
    this.isGreenVisiblePanX,
    this.x,
  }) : super(key: key);

  final Animation<double> animation;

  final bool isGreenVisible,
      isYellowVisible,
      isBlueVisible,
      isRedVisible,
      isRedVisiblePanX,
      isBlueVisiblePanX,
      isYellowVisiblePanX,
      isGreenVisiblePanX;

  final double height, x;

  @override
  State<ManualHorizontallyAnimatedCube> createState() => _ManualHorizontallyAnimatedCubeState(
    animation: this.animation,
    height: this.height,
    isRedVisible: this.isRedVisible,
    isBlueVisible: this.isBlueVisible,
    isYellowVisible: this.isYellowVisible,
    isGreenVisible: this.isGreenVisible,
    isRedVisiblePanX: this.isRedVisiblePanX,
    isBlueVisiblePanX: this.isBlueVisiblePanX,
    isYellowVisiblePanX: this.isYellowVisiblePanX,
    isGreenVisiblePanX: this.isGreenVisiblePanX,
    x: this.x,
  );
}

class _ManualHorizontallyAnimatedCubeState extends State<ManualHorizontallyAnimatedCube> {

  _ManualHorizontallyAnimatedCubeState({
    this.animation,
    this.height,
    this.isRedVisible,
    this.isBlueVisible,
    this.isYellowVisible,
    this.isGreenVisible,
    this.isRedVisiblePanX,
    this.isBlueVisiblePanX,
    this.isYellowVisiblePanX,
    this.isGreenVisiblePanX,
    this.x,
  });

  Animation<double> animation;

  bool isGreenVisible,
      isYellowVisible,
      isBlueVisible,
      isRedVisible,
      isRedVisiblePanX,
      isBlueVisiblePanX,
      isYellowVisiblePanX,
      isGreenVisiblePanX;

  double height, x;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          x = x + details.delta.dx / 100;
          // print(x);
          if(x >= 6.25 || x < 0) {
            x = 0;
          }
          if (x < 1.52 || x > 4.75) {
            isRedVisiblePanX = true;
          } else {
            isRedVisiblePanX = false;
          }
          if (x < 3.09) {
            isBlueVisiblePanX = true;
          } else {
            isBlueVisiblePanX = false;
          }
          if (x < 4.65) {
            isYellowVisiblePanX = true;
          } else {
            isYellowVisiblePanX = false;
          }
          if(x < 6.25) {
            isGreenVisiblePanX = true;
          }
          else {
            isGreenVisiblePanX = false;
          }
        });
      },
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: isGreenVisiblePanX,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate((height / 2) * cos(x), 0.0,
                    ((height / 2) * sin(x)))
                ..rotateY((-pi / 2) - x),
              child: Container(
                child: Center(child: GreenContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isYellowVisiblePanX,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(-(height / 2) * sin(x), 0.0,
                    ((height / 2) * cos(x)))
                ..rotateY((pi) - x),
              child: Container(
                child: Center(child: YellowContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isBlueVisiblePanX,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(-(height / 2) * cos(x), 0.0,
                    (-(height / 2) * sin(x)))
                ..rotateY((pi / 2) - (x)),
              child: Container(
                child: Center(child: BlueContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isRedVisiblePanX,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(
                  (height / 2) * sin(x),
                  0.0,
                  -((height / 2) * cos(x)),
                )
                ..rotateY(-x),
              child: Container(
                child: Center(child: RedContainer()),
              ),
            ),
          )
        ],
      ),
    );
  }
}