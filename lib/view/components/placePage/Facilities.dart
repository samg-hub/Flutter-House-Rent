import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import '../../../constant/ui.dart';

class Facilities extends StatefulWidget {
  const Facilities({super.key});
  @override
  State<StatefulWidget> createState() {
    return FacilitiesState();
  }
}

class FacilitiesState extends State<Facilities> {
  bool facililitiesStatus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Facilities",
          style: TextStyle(
              color: colorText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: dSpace_8 + dSpace_4,
        ),
        AnimatedSize(
          duration: const Duration(seconds: 1),
          alignment: Alignment.topCenter,
          curve: Curves.ease,
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                cardItemFacilities(
                    "Swimming pool",
                    imagePicker("swimming.png",
                        color: Colors.black54, size: 20)),
                cardItemFacilities("Lounge bar & cafe",
                    imagePicker("soda.png", color: Colors.black54, size: 20)),
                cardItemFacilities("Free wifi",
                    imagePicker("wifi.png", color: Colors.black54, size: 20)),
                cardItemFacilities(
                    "Air conditioner",
                    imagePicker("conditioner.png",
                        color: Colors.black54, size: 20)),
                facililitiesStatus == false ? plus10() : const SizedBox(),
                facililitiesStatus == true
                    ? AnimatedOpacity(
                        opacity: facililitiesStatus ? 1 : 0,
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.easeOutCirc,
                        child: cardItemFacilities(
                            "Lounge bar & cafe",
                            imagePicker("soda.png",
                                color: Colors.black54, size: 20)),
                      )
                    : Container(),
                facililitiesStatus == true
                    ? cardItemFacilities(
                        "Free wifi",
                        imagePicker("wifi.png",
                            color: Colors.black54, size: 20))
                    : Container(),
                facililitiesStatus == true
                    ? cardItemFacilities(
                        "Air conditioner",
                        imagePicker("conditioner.png",
                            color: Colors.black54, size: 20))
                    : Container(),
                facililitiesStatus == true ? plus10() : Container(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding plus10() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dSpace_8, vertical: dSpace_4),
      child: InkWell(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => colorBlue.withOpacity(0.1)),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        onTap: () {
          setState(() {
            facililitiesStatus = !facililitiesStatus;
          });
        },
        child: Ink(
          padding:
              EdgeInsets.symmetric(horizontal: dSpace_8, vertical: dSpace_8),
          decoration: const BoxDecoration(
              color: Color(0xFFF1F8FB),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Text(
            "+10",
            style: TextStyle(
                color: colorBlue, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Container cardItemFacilities(String txt, Widget icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dSpace_8, vertical: dSpace_4),
      padding: EdgeInsets.symmetric(horizontal: dSpace_8, vertical: dSpace_8),
      decoration: const BoxDecoration(
          color: Color(0xFFF1F8FB),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icons_24(icon),
          SizedBox(
            width: dSpace_8,
          ),
          Text(
            txt,
            style: TextStyle(color: colorGrayText),
          ),
          SizedBox(
            width: dSpace_4,
          )
        ],
      ),
    );
  }
}
