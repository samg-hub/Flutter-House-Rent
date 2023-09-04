import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../constant/functions.dart';
import '../../../constant/ui.dart';

class AboutText extends StatefulWidget {
  const AboutText({super.key, required this.txtAbout});
  final String txtAbout;
  @override
  State<StatefulWidget> createState() {
    return AboutTextState();
  }
}

class AboutTextState extends State<AboutText> {
  bool reademeStatus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
              color: colorText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: dSpace_8 + dSpace_4,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 340),
          alignment: Alignment.topCenter,
          curve: Curves.easeOutCirc,
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: stringLenght(reademeStatus ? widget.txtAbout.length : 120,
                  widget.txtAbout),
              style: TextStyle(color: colorGrayText, fontSize: 16),
            ),
            widget.txtAbout.length >
                    (reademeStatus ? widget.txtAbout.length : 120)
                ? TextSpan(
                    text: " Read more",
                    style: TextStyle(
                      color: colorBlue,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onTapClick)
                : TextSpan(
                    text: "Read less",
                    recognizer: TapGestureRecognizer()..onTap = onTapClick),
          ])),
        )
      ],
    );
  }

  void onTapClick() {
    setState(() {
      reademeStatus = !reademeStatus;
    });
  }
}
