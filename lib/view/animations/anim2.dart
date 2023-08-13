import 'dart:math';

import 'package:flutter/material.dart';

class Anim2 extends StatefulWidget {
  const Anim2({super.key});

  @override
  State<StatefulWidget> createState() => _Anim2();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) {
    return Future.delayed(duration, this);
  }
}

class _Anim2 extends State<Anim2> with TickerProviderStateMixin {
  late AnimationController _counterCloclwiseRotationController;
  late Animation<double> _counterCloclwiseRotationAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _counterCloclwiseRotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _counterCloclwiseRotationAnimation = Tween<double>(begin: 0, end: -(pi / 2))
        .animate(CurvedAnimation(
            parent: _counterCloclwiseRotationController,
            curve: Curves.bounceOut));

    _flipController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.bounceOut));

    _counterCloclwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
                begin: _flipAnimation.value, end: _flipAnimation.value + pi)
            .animate(CurvedAnimation(
                parent: _flipController, curve: Curves.bounceOut));
        _flipController
          ..reset()
          ..forward();
      }
    });

    _flipAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterCloclwiseRotationAnimation = Tween<double>(
                begin: _counterCloclwiseRotationAnimation.value,
                end: _counterCloclwiseRotationAnimation.value + -(pi / 2))
            .animate(CurvedAnimation(
                parent: _counterCloclwiseRotationController,
                curve: Curves.bounceOut));
        _counterCloclwiseRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _counterCloclwiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _counterCloclwiseRotationController
        ..reset()
        ..forward.delayed(const Duration(seconds: 1));
    });
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _counterCloclwiseRotationController,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(_counterCloclwiseRotationAnimation.value),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) => Transform(
                    alignment: Alignment.centerRight,
                    transform: Matrix4.identity()
                      ..rotateY(_flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.left),
                      child: Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) => Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..rotateY(_flipAnimation.value),
                    child: ClipPath(
                      clipper: const HalfCircleClipper(side: CircleSide.right),
                      child: Container(
                        color: Colors.yellow,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    late bool clockWise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockWise = true;
        break;
    }
    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockWise);
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;
  const HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
