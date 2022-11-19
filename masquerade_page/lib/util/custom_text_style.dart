import 'package:flutter/cupertino.dart';
import 'package:masquerade_page/util/custom_color.dart';

class CustomTextStyles {
  static TextStyle headingMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: CustomColors.black,
  );

  static TextStyle parraphMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: CustomColors.black,
  );

  static TextStyle headingGigant = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    color: CustomColors.white,
  );

  static TextStyle titleAppBar = TextStyle(
      fontSize: 70, fontFamily: 'CinzelBlack', color: CustomColors.white);

  static TextStyle buttonText = TextStyle(
      fontSize: 26, fontFamily: 'CinzelBold', color: CustomColors.white);
}
