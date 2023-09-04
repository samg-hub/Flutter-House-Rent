import 'package:flutter/material.dart';
import 'package:houserent/constant/ui.dart';

class HomeCardView extends StatefulWidget {
  const HomeCardView({super.key});

  @override
  State<HomeCardView> createState() => _HomeCardViewState();
}

class _HomeCardViewState extends State<HomeCardView>
    with TickerProviderStateMixin {
  bool _isSlideCardClosed = true;
  bool _dragRight = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animationController.addListener(() {
      setState(() {});
    });
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final maxDrag = size.width * 1.4;
    return SizedBox(
      height: 300,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          print(details.delta.dx);
          setState(() {
            details.delta.dx < 0 ? (_dragRight = false) : (_dragRight = true);
            final delta = details.delta.dx / maxDrag;
            _animationController.value += delta;
          });
        },
        onHorizontalDragEnd: (details) {
          if (_animationController.value < 0.5) {
            _animationController.reverse();
            setState(() {
              _isSlideCardClosed = true;
            });
          } else {
            _animationController.forward();
            setState(() {
              _isSlideCardClosed = false;
            });
          }
        },
        child: Stack(
          children: [
            Positioned(
              bottom: 14,
              child: Container(
                height: 260,
                width: size.width - dSpace_32,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            Positioned(
              bottom: 24,
              child: Container(
                height: 260,
                width: size.width - dSpace_32,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(25)),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              bottom: 40,
              child: Transform.translate(
                offset: Offset(_animation.value * (size.width - dSpace_32), 0),
                child: Container(
                  height: 260,
                  width: size.width - dSpace_32,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
