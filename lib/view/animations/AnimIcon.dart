import 'package:flutter/material.dart';

class AnimIcon extends StatefulWidget {
  const AnimIcon({super.key});

  @override
  State<AnimIcon> createState() => _AnimIconState();
}

class _AnimIconState extends State<AnimIcon> with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = const Color.fromARGB(255, 241, 241, 241);

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: const Text(
          "Flutter icon Animation",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeOutExpo,
          turns: turns,
          duration: const Duration(seconds: 1),
          child: GestureDetector(
            onTap: () {
              if (isClicked) {
                setState(() {
                  turns -= 1 / 4;
                  _controller.reverse();
                });
              } else {
                setState(() {
                  turns += 1 / 4;
                  _controller.forward();
                });
              }
              isClicked = !isClicked;
            },
            child: AnimatedContainer(
              curve: Curves.easeOutExpo,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: backColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        offset: isClicked
                            ? const Offset(20, -20)
                            : const Offset(20, 20),
                        color: Colors.black26),
                    BoxShadow(
                        blurRadius: 30.0,
                        offset: isClicked
                            ? const Offset(-20, 20)
                            : const Offset(-20, -20),
                        color: Colors.white)
                  ]),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
                      size: 100,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
