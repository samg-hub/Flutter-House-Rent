import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import '../../../constant/ui.dart';

class PlaceBottomBar extends StatelessWidget {
  const PlaceBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: dSpace_16),
          child: Ink(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 7,
                      spreadRadius: 0,
                      offset: const Offset(0, 3)),
                ],
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: dSpace_32, vertical: dSpace_16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            icons_24(imagePicker("gps.png")),
                            SizedBox(
                              width: dSpace_4,
                            ),
                            Text(
                              "Direction",
                              style: TextStyle(
                                  color: colorText,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green),
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: dSpace_32, vertical: dSpace_16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            icons_24(imagePicker("shopping-bag.png",
                                color: Colors.white)),
                            SizedBox(
                              width: dSpace_4,
                            ),
                            const Text(
                              "Reserve",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
