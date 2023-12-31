import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'common/utils/color_constants.dart';

Color backgroundColor =AppColors.lightblue;
Color primaryColor = HexColor("2283A0");
Color secondaryColor = Colors.grey;
Color greenColor = HexColor("68A020");


double borderRadius = 15;
double dialogueBorderRadius = 20;

height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

showSnack(BuildContext context, String message) {
  var snackBar = SnackBar(content: Text(message));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

navigation(BuildContext context, Widget navigateTo) {
  Navigator.of(context).push(
    PageTransition(
        type: PageTransitionType.fade,
        isIos: false,
        duration: Duration(milliseconds: 200),
        child: navigateTo),
  );
}
