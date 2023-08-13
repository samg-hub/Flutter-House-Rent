import 'dart:io';

import 'package:flutter/material.dart';

class AnimGpt extends StatefulWidget {
  const AnimGpt({super.key});

  @override
  _AnimGptState createState() => _AnimGptState();
}

class _AnimGptState extends State<AnimGpt> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Your other widgets go here
          Positioned.fill(
            child: InteractiveViewer(
              child: const Center(
                  child: SelectableText(
                      "Hello world!, welcome to the world of the world")),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text(Platform.isLinux ? "Next Generation" : "Model"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
