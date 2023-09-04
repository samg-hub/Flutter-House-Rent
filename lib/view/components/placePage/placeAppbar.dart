import 'package:flutter/material.dart';
import '../../../constant/ui.dart';
import '../Circleicon.dart';

class PlaceAppBar extends StatelessWidget {
  const PlaceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dSpace_12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Ink(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: colorBorderLightGray, width: 0.5)),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: colorGrayText,
                    size: 14,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(color: colorText, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              CircleIcon(
                  liked: false,
                  filledIcon: Image.asset(
                    "assets/icons/heart_filled.png",
                  ),
                  press: () {
                    print("Like");
                  },
                  icon: Image.asset(
                    "assets/icons/heart.png",
                    color: Colors.black54,
                  )),
              SizedBox(
                width: dSpace_8,
              ),
              CircleIcon(
                  liked: false,
                  press: () async {
                    ScaffoldMessenger.of(context)
                        .showMaterialBanner(MaterialBanner(
                      // elevation: 5,
                      backgroundColor: colorTGreen,
                      content: Row(
                        children: [
                          icons_24(const Icon(Icons.copy_outlined)),
                          SizedBox(
                            width: dSpace_8,
                          ),
                          const Text("Link Copied to clipboard"),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .clearMaterialBanners();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white38,
                            ),
                          ),
                        )
                      ],
                    ));
                    Future.delayed(const Duration(seconds: 2)).then((value) {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                    });
                  },
                  filledIcon: Image.asset(
                    "assets/icons/upload.png",
                    color: Colors.black54,
                  ),
                  icon: Image.asset(
                    "assets/icons/upload.png",
                    color: Colors.black54,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
