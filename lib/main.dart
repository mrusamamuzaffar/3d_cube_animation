import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_3d_box/my_app_behavior.dart';
import 'package:flutter_3d_box/widgets/auto_horizontally_animated_cube.dart';
import 'package:flutter_3d_box/widgets/auto_vertically_animated_cube.dart';
import 'package:flutter_3d_box/widgets/manual_horizontally_animated_cube.dart';
import 'package:flutter_3d_box/widgets/manual_vertically_animated_cube.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Box',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin, MyAppBehavior {

   _MyAppState();

  void initAnimationController() {
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: 360 * pi/180).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value < 85 * (pi / 180)  || animation.value > 275 * (pi/180)) {
            isRedVisible = true;
          } else {
            isRedVisible = false;
          }
          if (animation.value < 176 * (pi / 180)) {
            isBlueVisible = true;
          } else {
            isBlueVisible = false;
          }
          if (animation.value < 265 * (pi / 180)) {
            isYellowVisible = true;
          } else {
            isYellowVisible = false;
          }
          if(animation.value < 355 * (pi/180)) {
            isGreenVisible = true;
          }
          else {
            isGreenVisible = false;
          }
        });
      });
  }

  @override
  void initState() {
    initAnimationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoVerticallyAnimatedCube(
                animation: animation,
                height: height,
                isRedVisible: isRedVisible,
                isBlueVisible: isBlueVisible,
                isYellowVisible: isYellowVisible,
                isGreenVisible: isGreenVisible,
              ),
              AutoHorizontallyAnimatedCube(
                animation: animation,
                height: height,
                isRedVisible: isRedVisible,
                isBlueVisible: isBlueVisible,
                isYellowVisible: isYellowVisible,
                isGreenVisible: isGreenVisible,
              ),
            ],
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.forward();
                  },
                  child: Text('animate')),
              ElevatedButton(
                  onPressed: () {
                    controller.reset();
                  },
                  child: Text('reset')),
              ElevatedButton(
                  onPressed: () {
                    controller.repeat();
                  },
                  child: Text('repeat')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ManualVerticallyAnimatedCube(
                animation: animation,
                height: height,
                isRedVisible: isRedVisible,
                isBlueVisible: isBlueVisible,
                isYellowVisible: isYellowVisible,
                isGreenVisible: isGreenVisible,
                isRedVisiblePanY: isRedVisiblePanY,
                isBlueVisiblePanY: isBlueVisiblePanY,
                isYellowVisiblePanY: isYellowVisiblePanY,
                isGreenVisiblePanY: isGreenVisiblePanY,
                y: y,
              ),
              ManualHorizontallyAnimatedCube(
                animation: animation,
                height: height,
                isRedVisible: isRedVisible,
                isBlueVisible: isBlueVisible,
                isYellowVisible: isYellowVisible,
                isGreenVisible: isGreenVisible,
                isRedVisiblePanX: isRedVisiblePanX,
                isBlueVisiblePanX: isBlueVisiblePanX,
                isYellowVisiblePanX: isYellowVisiblePanX,
                isGreenVisiblePanX: isGreenVisiblePanX,
                x: x,
              ),
            ],
          ),
        ],
      ),
    );
  }
}