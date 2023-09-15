import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'half_circle_clipper.dart';

class YingYangAnimation extends StatefulWidget {
  const YingYangAnimation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _YingYangAnimationState();
  }
}


class _YingYangAnimationState extends State<YingYangAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotate;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _rotate = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween<double>(begin: 2.0 * pi, end: 0.0 * pi).animate(_rotate);
    _rotate.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(_animation.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: HalfCircleClipper(circleSide: CircleSide.left),
                      child: Container(
                          width: 160, height: 160, color: Colors.white),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 80,
                      left: 80,
                      right: 0,
                      child: ClipPath(
                        clipper: HalfCircleClipper(circleSide: CircleSide.left),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 145,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: HalfCircleClipper(circleSide: CircleSide.right),
                      child: Container(
                          width: 160, height: 160, color: Colors.black),
                    ),
                    Positioned(
                      top: 80,
                      bottom: 0,
                      left: 0,
                      right: 80,
                      child: ClipPath(
                        clipper:
                            HalfCircleClipper(circleSide: CircleSide.right),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
