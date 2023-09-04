import 'dart:math';

import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import 'package:houserent/constant/ui.dart';
import 'package:provider/provider.dart';

class SwipCardAnim extends StatefulWidget {
  const SwipCardAnim({super.key});

  @override
  State<SwipCardAnim> createState() => _SwipCardAnimState();
}

class _SwipCardAnimState extends State<SwipCardAnim> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: const Scaffold(
        body: SafeArea(
          child: TinderCardState(),
        ),
      ),
    );
  }
}

class CardProvider extends ChangeNotifier {
  bool _isDragging = false;
  double _angle = 0.0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = (45 * x / _screenSize.width);
    notifyListeners();
  }

  void endPosition() {}

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}

class TinderCardState extends StatefulWidget {
  const TinderCardState({
    super.key,
  });

  @override
  State<TinderCardState> createState() => _TinderCardStateState();
}

class _TinderCardStateState extends State<TinderCardState> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onPanStart: (details) {
      final provide = Provider.of<CardProvider>(context, listen: false);
      provide.startPosition(details);
    }, onPanUpdate: (details) {
      final provide = Provider.of<CardProvider>(context, listen: false);
      provide.updatePosition(details);
    }, onPanEnd: (details) {
      final provide = Provider.of<CardProvider>(context, listen: false);
      provide.endPosition();
    }, child: LayoutBuilder(builder: (context, constrains) {
      final provider = Provider.of<CardProvider>(context, listen: true);
      final position = provider.position;
      final int millisecond = provider.isDragging ? 0 : 400;

      final center = constrains.smallest.center(Offset.zero);
      final angle = provider.angle * pi / 180;
      final rotateMatrix = Matrix4.identity()
        ..rotateZ(angle)
        ..translate(-center.dx, -center.dy)
        ..translate(center.dx, center.dy);

      return AnimatedContainer(
          curve: Curves.easeInOut,
          transform: rotateMatrix..translate(position.dx, position.dy),
          duration: Duration(milliseconds: millisecond),
          child: buildFrontCard(context));
    }));
  }

  Container buildFrontCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: EdgeInsets.all(dSpace_16),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: imagePicker("oisis1.jpg", image: true)),
    );
  }
}
