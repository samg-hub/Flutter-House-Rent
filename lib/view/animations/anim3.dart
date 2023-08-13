import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Anim3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Anim3();
}

class _Anim3 extends State<Anim3> with TickerProviderStateMixin {
  late AnimationController _XController;
  late AnimationController _YController;
  late AnimationController _ZController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _XController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _YController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _ZController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween<double>(begin: 0, end: pi * 2);
  }

  @override
  void dispose() {
    _XController.dispose();
    _YController.dispose();
    _ZController.dispose();
    super.dispose();
  }

  static double wh = 100;
  @override
  Widget build(BuildContext context) {
    _XController
      ..reset()
      ..repeat();
    _YController
      ..reset()
      ..repeat();
    _ZController
      ..reset()
      ..repeat();

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation:
              Listenable.merge([_XController, _YController, _ZController]),
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateY(_animation.evaluate(_YController))
              ..rotateX(_animation.evaluate(_XController))
              ..rotateZ(_animation.evaluate(_ZController)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      border: Border.all(color: Colors.black, width: 1)),
                  width: wh,
                  height: wh,
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(Vector3(0.0, 0.0, -wh)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        border: Border.all(color: Colors.black, width: 1)),
                    width: wh,
                    height: wh,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()
                    ..rotateY(pi / 2)
                    ..translate(Vector3(wh, 0, 0)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        border: Border.all(color: Colors.black, width: 1)),
                    width: wh,
                    height: wh,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..rotateY(pi / 2)
                    ..translate(Vector3(0, 0, 0)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lime.withOpacity(0.5),
                        border: Border.all(color: Colors.black, width: 1)),
                    width: wh,
                    height: wh,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..rotateX(pi / 2)
                    ..translate(Vector3(0, -wh / 2, -wh / 2)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.5),
                        border: Border.all(color: Colors.black, width: 1)),
                    width: wh,
                    height: wh,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..rotateX(pi / 2)
                    ..translate(Vector3(0, -wh / 2, wh / 2)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.5),
                        border: Border.all(color: Colors.black, width: 1)),
                    width: wh,
                    height: wh,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
