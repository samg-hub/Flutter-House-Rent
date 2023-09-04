import 'dart:math';

import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import '../../../constant/ui.dart';

class TopCard extends StatefulWidget {
  final String txtPlace;
  final String txtPoint;
  final String txtDitance;
  const TopCard(
      {super.key,
      required this.txtPlace,
      required this.txtPoint,
      required this.txtDitance});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> with SingleTickerProviderStateMixin {
  late AnimationController _animDescController;
  late Animation<double> _animDesc;
  late PageController _pageViewKey;
  int _pageViewIndex = 0;
  bool _zoomIn = false;
  @override
  void initState() {
    super.initState();
    _pageViewKey = PageController(initialPage: 0);
    _animDescController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animDesc = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animDescController, curve: Curves.easeInOutCirc));
  }

  @override
  void dispose() {
    _animDescController.dispose();
    _pageViewKey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _zoomIn = !_zoomIn;
              if (_zoomIn) {
                _animDescController.forward();
              } else {
                _animDescController.reverse();
              }
            });
            print("check");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCirc,
            height: _zoomIn ? 350 : 300,
            alignment: Alignment.topCenter,
            width: size.width,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCirc,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              height: _zoomIn ? 300 : 250,
              child: PageView.builder(
                controller: _pageViewKey,
                onPageChanged: (value) {
                  setState(() {
                    _pageViewIndex = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: dSpace_12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      child: imagePicker(
                          "oisis${index == 0 ? "1" : (index == 1 ? "2" : "3")}.jpg",
                          image: true),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 200,
            left: dSpace_16,
            right: dSpace_32,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: EdgeInsets.only(top: _zoomIn ? 70 : 0),
              child: SizedBox(
                height: 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _pageViewIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ]),
                      margin: EdgeInsets.symmetric(horizontal: dSpace_4),
                      width: _pageViewIndex == index ? 4 : 15,
                      height: _pageViewIndex == index ? 20 : 4,
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
          bottom: 0,
          left: dSpace_12,
          right: dSpace_12,
          child: AnimatedBuilder(
            animation: _animDescController,
            builder: (context, child) => Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX((_animDesc.value * 1.4) - pi / 180),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _zoomIn ? 0 : 1,
                curve: Curves.easeInOutCirc,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      vertical: dSpace_12, horizontal: dSpace_16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, 20))
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.txtPlace,
                                style: TextStyle(
                                    color: colorText,
                                    fontSize: 20,
                                    fontFamily: "CSRBold",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: dSpace_4,
                              ),
                              Row(
                                children: [
                                  icons_24(
                                    imagePicker("star.png",
                                        color: Colors.black54, size: 20),
                                  ),
                                  Text(
                                    widget.txtPoint,
                                    style: TextStyle(
                                      color: colorGrayText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: dSpace_8,
                                  ),
                                  icons_24(
                                    imagePicker("gps.png",
                                        color: Colors.black54, size: 22),
                                  ),
                                  Text(
                                    widget.txtDitance,
                                    style: TextStyle(color: colorGrayText),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "/height",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "\$55",
                                style: TextStyle(
                                    color: colorTGreen,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "CSRBold",
                                    fontSize: 24),
                              ),
                              Text(
                                "/night",
                                style: TextStyle(color: colorGrayText),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
