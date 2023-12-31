import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransformAnimationState();
  }
}

class _TransformAnimationState extends State<TransformAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0.0, end: 2.0 * pi).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
                builder: (ctx, child) {
                  return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(animation.value)..rotateZ(animation.value)..rotateX(animation.value*2),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3))
                            ]),
                      ));
                },
                animation: animation)));
  }
}
