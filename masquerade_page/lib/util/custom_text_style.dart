import 'package:flutter/cupertino.dart';
import 'package:masquerade_page/util/custom_color.dart';

class CustomTextStyles {
  static const TextStyle titleAppBar = TextStyle(
      fontSize: 70, fontFamily: 'CinzelBlack', color: CustomColors.white);

  static const TextStyle title = TextStyle(
      fontSize: 75, fontFamily: 'CinzelBold', color: CustomColors.white);

  static const TextStyle buttonText = TextStyle(
      fontSize: 26, fontFamily: 'CinzelBold', color: CustomColors.white);

  static const TextStyle subtitle = TextStyle(
      fontSize: 46,
      fontFamily: 'CinzelBlack',
      color: CustomColors.white,
      decoration: TextDecoration.underline);

  static const TextStyle resume = TextStyle(
      fontSize: 46, fontFamily: 'CinzelBold', color: CustomColors.white);

  static const TextStyle content = TextStyle(
      fontSize: 20, fontFamily: 'Transcend', color: CustomColors.white);

  static const TextStyle teamMembers = TextStyle(
      fontSize: 18, fontFamily: 'CinzelRegular', color: CustomColors.white);

  static const TextStyle cardText = TextStyle(
      fontSize: 40, fontFamily: 'CinzelBold', color: CustomColors.white);
}
