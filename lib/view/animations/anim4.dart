import 'package:flutter/material.dart';

class Anim4 extends StatefulWidget {
  const Anim4({super.key});

  @override
  State<StatefulWidget> createState() => _Anim4();
}

const double defaultWidth = 100;

class _Anim4 extends State<Anim4> {
  bool _isZoomin = false;
  double _width = defaultWidth;
  final _curve = Curves.easeIn;
  double iconseze = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: _curve,
              width: _width,
              height: iconseze,
              color: Colors.red,
              child: const Icon(
                Icons.abc,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    iconseze = _isZoomin ? 80 : 50;
                    _width = _isZoomin
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;
                    _isZoomin = !_isZoomin;
                  });
                },
                child: Text(_isZoomin == true ? "Zoom in" : "Zoom out"))
          ],
        ),
      ),
    );
  }
}
