import 'dart:math';

import 'package:flutter/material.dart';

class HomeSliderPage extends StatefulWidget {
  const HomeSliderPage({super.key});

  @override
  State<HomeSliderPage> createState() => _HomeSliderPageState();
}

class _HomeSliderPageState extends State<HomeSliderPage>
    with TickerProviderStateMixin {
  bool _isSlideMenuClosed = true;
  late AnimationController _animationController;
  late AnimationController _animationControllerSlider;
  late Animation<double> _animation;
  late Animation<double> _animationSlider;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });
    _animationControllerSlider = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationSlider = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationControllerSlider, curve: Curves.linear));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSlider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final maxDrag = screenWidth * 1.4;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final delta = details.delta.dx / maxDrag;
        _animationController.value += delta;
        _animationControllerSlider.value += delta;
      },
      onHorizontalDragEnd: (details) {
        if (_animationController.value < 0.5) {
          _animationController.reverse();
          _animationControllerSlider.reverse();
          setState(() {
            _isSlideMenuClosed = true;
          });
        } else {
          setState(() {
            _isSlideMenuClosed = false;
          });
          _animationController.forward();
          _animationControllerSlider.forward();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 26, 53),
        body: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            width: 260,
            left: -260 + (_animationSlider.value * 260),
            height: MediaQuery.of(context).size.height,
            child: const SliderSide(),
          ),
          Transform.translate(
              offset: Offset(_animation.value * 220, 0),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                        _animation.value - 30 * _animation.value * pi / 180),
                  //..rotateY(1 - 30 * pi / 180),
                  child: HomeSlider(
                    isSlideMenuClosed: !_isSlideMenuClosed,
                    menu: () {
                      print("pess");
                      if (_isSlideMenuClosed) {
                        _animationController.forward();
                        _animationControllerSlider.forward();
                      } else {
                        _animationController.reverse();
                        _animationControllerSlider.reverse();
                      }
                      setState(() {
                        _isSlideMenuClosed = !_isSlideMenuClosed;
                      });
                    },
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

class HomeSlider extends StatelessWidget {
  final VoidCallback menu;
  final bool isSlideMenuClosed;
  const HomeSlider(
      {super.key, required this.menu, required this.isSlideMenuClosed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: MenuIcon(
              press: menu,
            ),
            title: const Text(
              "Slider Page State",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: const ListviewExample(),
          ),
        ),
        isSlideMenuClosed
            ? Positioned.fill(
                top: 56,
                child: Container(
                  color: Colors.black26,
                ))
            : const SizedBox()
      ],
    );
  }
}

class MenuIcon extends StatelessWidget {
  final VoidCallback press;
  const MenuIcon({
    super.key,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
    );
  }
}

class SliderSide extends StatefulWidget {
  const SliderSide({super.key});

  @override
  State<SliderSide> createState() => _SliderSideState();
}

class _SliderSideState extends State<SliderSide> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 26, 53),
        body: SizedBox(
          width: 260,
          child: Material(
            color: Color.fromARGB(255, 22, 26, 53),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "List Item is : ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(child: ListviewExample()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListviewExample extends StatelessWidget {
  const ListviewExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text("Title $index"),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
