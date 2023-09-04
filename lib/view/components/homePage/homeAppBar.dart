import 'package:flutter/material.dart';
import 'package:houserent/constant/functions.dart';
import 'package:houserent/constant/ui.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _homeAppBar();
  }
}

class _homeAppBar extends State<HomeAppBar> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _controllerSearchIcon;
  bool isClickedSearchIcon = false;

  @override
  void initState() {
    _controllerSearchIcon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _controllerSearchIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: dSpace_16, right: dSpace_8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(28)),
        border: Border.all(color: colorBorderLightGray, width: 0.5),
      ),
      child: Row(
        children: [
          icons_24(imagePicker("pin.png", color: colorTGreen)),
          const SizedBox(
            width: 12,
          ),
          Text(
            "Bail,IDN",
            style: TextStyle(
                color: colorText, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: dSpace_32,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: colorTGreen,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintText: "Where can i take you?",
                  hintStyle: TextStyle(color: colorGrayText)),
              style: TextStyle(color: colorText),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.black12),
              onTap: () {
                if (isClickedSearchIcon) {
                  setState(() {
                    _controllerSearchIcon.reverse();
                  });
                } else {
                  setState(() {
                    _controllerSearchIcon.forward();
                  });
                }
                isClickedSearchIcon = !isClickedSearchIcon;
              },
              child: icons_40(RotatedBox(
                quarterTurns: 0,
                child: AnimatedIcon(
                  icon: AnimatedIcons.search_ellipsis,
                  progress: _controllerSearchIcon,
                  size: 25,
                  color: colorIconGray,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
