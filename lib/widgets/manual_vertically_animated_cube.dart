import 'package:flutter/material.dart';
import 'dart:math';
import 'cube_sides/blue_container.dart';
import 'cube_sides/green_container.dart';
import 'cube_sides/red_container.dart';
import 'cube_sides/yellow_container.dart';

class ManualVerticallyAnimatedCube extends StatefulWidget {
  const ManualVerticallyAnimatedCube({Key key,
    this.animation,
    this.height,
    this.isRedVisible,
    this.isBlueVisible,
    this.isYellowVisible,
    this.isGreenVisible,
    this.isRedVisiblePanY,
    this.isBlueVisiblePanY,
    this.isYellowVisiblePanY,
    this.isGreenVisiblePanY,
    this.y,
  }) : super(key: key);

  final Animation<double> animation;

  final bool isGreenVisible,
      isYellowVisible,
      isBlueVisible,
      isRedVisible,
      isRedVisiblePanY,
      isBlueVisiblePanY,
      isYellowVisiblePanY,
      isGreenVisiblePanY;

  final double height, y;

  @override
  State<ManualVerticallyAnimatedCube> createState() => _ManualVerticallyAnimatedCubeState(
    animation: this.animation,
    height: this.height,
    isRedVisible: this.isRedVisible,
    isBlueVisible: this.isBlueVisible,
    isYellowVisible: this.isYellowVisible,
    isGreenVisible: this.isGreenVisible,
    isRedVisiblePanY: this.isRedVisiblePanY,
    isBlueVisiblePanY: this.isBlueVisiblePanY,
    isYellowVisiblePanY: this.isYellowVisiblePanY,
    isGreenVisiblePanY: this.isGreenVisiblePanY,
    y: this.y,
  );
}

class _ManualVerticallyAnimatedCubeState extends State<ManualVerticallyAnimatedCube> {

  _ManualVerticallyAnimatedCubeState({
    this.animation,
    this.height,
    this.isRedVisible,
    this.isBlueVisible,
    this.isYellowVisible,
    this.isGreenVisible,
    this.isRedVisiblePanY,
    this.isBlueVisiblePanY,
    this.isYellowVisiblePanY,
    this.isGreenVisiblePanY,
    this.y,
  });

  Animation<double> animation;

  bool isGreenVisible,
      isYellowVisible,
      isBlueVisible,
      isRedVisible,
      isRedVisiblePanY,
      isBlueVisiblePanY,
      isYellowVisiblePanY,
      isGreenVisiblePanY;

  double height, y;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          y = y + details.delta.dy / 100;
          // print(y);
          if(y >= 6.25 || y < 0) {
            y = 0;
          }
          if (y < 1.52 || y > 4.75) {
            isRedVisiblePanY = true;
          } else {
            isRedVisiblePanY = false;
          }
          if (y < 3.09) {
            isBlueVisiblePanY = true;
          } else {
            isBlueVisiblePanY = false;
          }
          if (y < 4.65) {
            isYellowVisiblePanY = true;
          } else {
            isYellowVisiblePanY = false;
          }
          if(y < 6.25) {
            isGreenVisiblePanY = true;
          }
          else {
            isGreenVisiblePanY = false;
          }
        });
      },
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: isGreenVisiblePanY,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, (cos(y) * (widget.height / 2)),
                    ((widget.height / 2) * sin(y)))
                ..rotateX((pi / 2) + y),
              child: Container(
                child: Center(child: GreenContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isYellowVisiblePanY,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, -(sin(y) * (widget.height / 2)),
                    ((widget.height / 2) * cos(y)))
                ..rotateX((pi) + y),
              child: Container(
                child: Center(child: YellowContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isBlueVisiblePanY,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, -(cos(y) * (widget.height / 2)),
                    (-(widget.height / 2) * sin(y)))
                ..rotateX(-(pi / 2) + y),
              child: Container(
                child: Center(child: BlueContainer()),
              ),
            ),
          ),
          Visibility(
            visible: isRedVisiblePanY,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(
                  0.0,
                  (widget.height / 2) * sin(y),
                  -((widget.height / 2) * cos(y)),
                )
                ..rotateX(y),
              child: Container(
                child: Center(child: RedContainer()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
