import 'package:flutter/material.dart';

class CircleIcon extends StatefulWidget {
  final VoidCallback press;
  final Widget filledIcon;
  bool liked;
  bool? brdered;
  final Widget icon;
  CircleIcon(
      {super.key,
      required this.icon,
      required this.press,
      required this.filledIcon,
      required this.liked,
      this.brdered});

  @override
  State<CircleIcon> createState() => _CircleIconState();
}

class _CircleIconState extends State<CircleIcon> {
  bool _shadow = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press();
        setState(() {
          widget.liked = !widget.liked;
          _shadow = true;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        onEnd: () {
          setState(() {
            _shadow = false;
          });
        },
        curve: Curves.easeOutCirc,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          border: (_shadow && widget.brdered != false) == false
              ? Border.all(
                  color: Colors.black45,
                  width: 0.5,
                )
              : Border.all(color: Colors.white),
          boxShadow: _shadow
              ? const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ]
              : [],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
            child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                scale: _shadow ? 0.7 : 0.5,
                curve: Curves.easeOutCirc,
                child: widget.liked ? widget.filledIcon : widget.icon)),
      ),
    );
  }
}
