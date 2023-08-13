import 'dart:math';

import 'package:flutter/material.dart';

class Anim5 extends StatefulWidget {
  const Anim5({super.key});

  @override
  State<StatefulWidget> createState() => _Anim5();
}

Color getRandomColor() => Color(0xFF000000 + Random().nextInt(0x00FFFFFF));

class _Anim5 extends State<Anim5> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..repeat();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("complete");
      }
    });
    Size size = MediaQuery.of(context).size;
    var color = getRandomColor();
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: getRandomColor(), end: color),
            onEnd: () {
              setState(() {
                color = getRandomColor();
              });
            },
            duration: const Duration(seconds: 2),
            child: Container(
              height: size.width,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
            builder: (context, value, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(value!, BlendMode.srcATop),
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Rect rect = Rect.fromPoints(const Offset(0, 0), const Offset(20, 40));

    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    // path.addRect(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
