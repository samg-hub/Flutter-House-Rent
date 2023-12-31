import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

//Standard Size of UI
double dSpace_4 = 4;
double dSpace_8 = 8;
double dSpace_12 = 12;
double dSpace_16 = 16;
double dSpace_32 = 32;
//Colors of UI
Color colorText = const Color(0xFF212121);
Color colorLightBack = const Color(0xFFfafafa);
Color colorWhite = Colors.white;
Color colorTGreen = const Color(0xFF00a37f);
Color colorGrayText = const Color(0xFF9e9e9e);
Color colorIconGray = Colors.black54;
Color colorBlue = const Color(0xFF2196f3);
Color colorBorderLightGray = const Color(0xFFe0e0e0);

dynamic cGradientDefault = const LinearGradient(colors: [
  Color(0xff522C5F),
  Color(0xffC82A4C),
], transform: GradientRotation(0.8));

//TextStyle
// TextStyle text_20 =
// TextStyle(color: C_textColor, fontSize: 20, fontFamily: "vazir");
// TextStyle text_16 =
// TextStyle(color: C_textColor, fontSize: 16, fontFamily: "vazir");
// TextStyle text_14 =
// TextStyle(color: C_textColor, fontSize: 14, fontFamily: "vazir");
// TextStyle text_14_bold =
// TextStyle(color: C_textColor, fontSize: 14, fontFamily: "vazirbold");
// TextStyle text_12 =
// TextStyle(color: C_textColor, fontSize: 12, fontFamily: "vazir");
// TextStyle text_12_bold =
// TextStyle(color: C_textColor, fontSize: 12, fontFamily: "vazirbold");
// TextStyle text_16_bold =
// TextStyle(color: C_textColor, fontSize: 16, fontFamily: "vazirbold");
// TextStyle text_20_bold =
// TextStyle(color: C_textColor, fontSize: 20, fontFamily: "vazirbold");

//IconSize
Widget icons_48(Widget icon) {
  return Container(
    decoration: const BoxDecoration(
        // border: Border.all(color: C_red,width: 1)
        ),
    height: 48,
    width: 48,
    child: Center(child: icon),
  );
}

Widget icons_40(Widget icon) {
  return Container(
    decoration: const BoxDecoration(
        // border: Border.all(color: C_red,width: 1)
        ),
    height: 40,
    width: 40,
    child: Center(child: icon),
  );
}

Widget icons_24(Widget icon) {
  return SizedBox(
    // decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
    height: 24,
    width: 24,
    child: Center(child: icon),
  );
}

Widget icons_16(Widget icon) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
    height: 16,
    width: 16,
    child: Center(child: icon),
  );
}

Widget profileLoading(String? url,
    {Widget? iconHolder, double? borderRadius, double progressSize = 24}) {
  if (url != null) {
    return ClipRRect(
      borderRadius: BorderRadius.all(borderRadius != null
          ? Radius.circular(borderRadius)
          : const Radius.circular(10)),
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, text, progress) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: progressSize,
                width: progressSize,
                child: CircularProgressIndicator(
                    color: Colors.black26,
                    strokeWidth: 1,
                    value: progress.progress)),
          ],
        ),
        imageUrl: url,
        errorWidget: (context, text, dynamic) =>
            iconHolder ??
            Icon(
              Icons.person,
              color: colorText,
              size: 30,
            ),
        fit: BoxFit.cover,
      ),
    );
  } else {
    return iconHolder ??
        Center(
            child: icons_40(Icon(
          Icons.person,
          color: colorText,
          size: 30,
        )));
  }
}

//showDialogMessage
class Dialogs {
  void showSnackBar(BuildContext context, String message,
      {IconData icon = Icons.info_outline}) {
    showToastWidget(
      SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: dSpace_16, vertical: dSpace_16),
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: dSpace_32),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: colorWhite,
            // border: Border.all(width: 1,color: C_lightBlue),
            // boxShadow: const[dShadowBox]
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icons_24(Icon(
                icon,
                color: colorLightBack,
              )),
              SizedBox(
                width: dSpace_8,
              ),
              // Flexible(child: Text(message, style: text_14)),
              // IconButton(
              //   onPressed: () {
              //     ToastManager().dismissAll(showAnim: true);
              //   },
              //   icon: Icon(
              //     Icons.info_outline,
              //     color: C_blue,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: false,
      alignment: Alignment.topCenter,
      position: const StyledToastPosition(align: Alignment.topCenter),
      animation: StyledToastAnimation.slideToBottomFade,
      dismissOtherToast: true,
      textDirection: TextDirection.rtl,
      reverseAnimation: StyledToastAnimation.fade,
      duration: const Duration(seconds: 4),
    );
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message,style: text_16.apply(color: C_white),)));
  }
}

const dShadowBox = BoxShadow(
  color: Color.fromARGB(65, 58, 73, 92),
  spreadRadius: 0,
  blurRadius: 12,
  offset: Offset(0, 4),
);
