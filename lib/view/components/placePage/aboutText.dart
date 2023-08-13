import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../constant/functions.dart';
import '../../../constant/ui.dart';

class AboutText extends StatefulWidget {
  AboutText({super.key, required this.txtAbout});
  String? txtAbout;
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
        const Text(
          "About",
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: dSpace_8 + dSpace_4,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: stringLenght(reademeStatus ? widget.txtAbout!.length : 120,
                widget.txtAbout!),
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
          widget.txtAbout!.length >
                  (reademeStatus ? widget.txtAbout!.length : 120)
              ? TextSpan(
                  text: " Read more",
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = onTapClick)
              : TextSpan(
                  text: "Read less",
                  recognizer: TapGestureRecognizer()..onTap = onTapClick),
        ]))
      ],
    );
  }

  void onTapClick() {
    setState(() {
      reademeStatus = !reademeStatus;
    });
  }
}
