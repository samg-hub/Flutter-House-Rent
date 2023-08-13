import 'dart:math';

import 'package:flutter/material.dart';

class Anim6 extends StatefulWidget {
  const Anim6({super.key});

  @override
  State<StatefulWidget> createState() => _Anim6();
}

class Poligon extends CustomPainter {
  Poligon({required this.sides});
  final int sides;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;

    path.moveTo(center.dx + radius * cos(0), center.dy + radius * sin(0));

    for (final angle in angles) {
      path.lineTo(
          center.dx + radius * cos(angle), center.dy + radius * sin(angle));
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Poligon && oldDelegate.sides != sides;
}

class _Anim6 extends State<Anim6> with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sidesAnimation;

  @override
  void initState() {
    super.initState();

    _sidesController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _sidesAnimation = IntTween(begin: 3, end: 20).animate(_sidesController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _sidesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _sidesAnimation,
            ]),
            builder: (context, child) => CustomPaint(
              painter: Poligon(sides: _sidesAnimation.value),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
