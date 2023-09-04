import 'dart:math';

import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import 'package:houserent/constant/ui.dart';
import 'package:houserent/view/components/Circleicon.dart';

class CardViewplace extends StatefulWidget {
  const CardViewplace({super.key});

  @override
  State<StatefulWidget> createState() => _CardViewplace();
}

class _CardViewplace extends State<CardViewplace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: imagePicker("oisis${Random().nextInt(3) + 1}.jpg",
                      image: true),
                ),
              ),
              Positioned(
                top: dSpace_12,
                left: dSpace_12,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: dSpace_12, vertical: dSpace_12),
                  decoration: BoxDecoration(
                      color: colorText,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "2 offers",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: dSpace_12,
                right: dSpace_12,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: CircleIcon(
                      brdered: false,
                      icon: imagePicker("bookmark.png"),
                      press: () {},
                      filledIcon:
                          imagePicker("bookmark_filled.png", color: colorBlue),
                      liked: false),
                ),
              ),
            ],
          ),
          SizedBox(
            height: dSpace_8,
          ),
          SizedBox(
            width: 200,
            child: Text(
              "The oasis Lagoon Sanur ",
              maxLines: 2,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: colorText,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: dSpace_4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icons_24(
                    imagePicker("star.png", color: Colors.black54, size: 20)),
                SizedBox(
                  width: dSpace_4,
                ),
                const Text(
                  "4.8",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  width: dSpace_8,
                ),
                icons_24(
                    imagePicker("gps.png", color: Colors.black54, size: 20)),
                const Text(
                  "21 miles",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: dSpace_4),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$55",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "/nights",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
