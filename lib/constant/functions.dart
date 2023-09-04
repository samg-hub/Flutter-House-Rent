import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

debugPrintFunction(Object? txt) {
  if (kDebugMode) {
    print(txt);
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  debugPrintFunction("phone number is : $phoneNumber");
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  bool res = await canLaunchUrl(launchUri);
  if (res) {
    await launchUrl(launchUri);
  }
}

Widget imagePicker(String addr,
    {double? size, Color? color, bool? image, BoxFit fit = BoxFit.cover}) {
  return SizedBox(
    width: size,
    height: size,
    child: image == true
        ? Image.asset(
            "assets/images/$addr",
            fit: fit,
          )
        : Image.asset(
            "assets/icons/$addr",
            color: color,
          ),
  );
}

String stringLenght(int lenght, String txt) {
  String result = "";
  if (txt.length <= lenght) {
    return txt;
  }
  for (var i = 0; i < lenght; i++) {
    result += txt[i];
  }
  return result;
}
