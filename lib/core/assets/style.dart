import 'package:flutter/cupertino.dart';
import 'package:pemanen_flutter/core/assets/color.dart';

class AppStyle {

  static TextStyle headingRegular({Color textColor = AppColor.highEmphasis}) =>
      TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.2,
          fontStyle: FontStyle.normal,
          color: textColor);

  static TextStyle headingMedium({Color textColor = AppColor.highEmphasis}) =>
      TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          height: 1.4,
          fontStyle: FontStyle.normal,
          color: textColor);

  static TextStyle headingLarge({Color textColor = AppColor.highEmphasis}) =>
      TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 1.5,
          fontStyle: FontStyle.normal,
          color: textColor);

  static TextStyle headline6({Color textColor = AppColor.white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 1.4,
      color: textColor,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal);

  static TextStyle nominal({Color textColor = AppColor.highEmphasis}) => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.25,
      color: textColor,
      fontStyle: FontStyle.normal);

  static TextStyle label(
          {Color textColor = AppColor.highEmphasis,
          FontWeight weight = FontWeight.w500}) =>
      TextStyle(
          fontWeight: weight,
          color: textColor,
          fontSize: 12,
          height: 1.4,
          fontStyle: FontStyle.normal);

  static TextStyle body(
          {Color textColor = AppColor.highEmphasis,
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
          fontWeight: weight,
          color: textColor,
          fontSize: 14,
          height: 1.57,
          fontStyle: FontStyle.normal);

  static TextStyle caption(
          {Color textColor = AppColor.highEmphasis,
          FontWeight weight = FontWeight.w400}) =>
      TextStyle(
          fontWeight: weight,
          color: textColor,
          fontSize: 12,
          height: 1.4,
          fontStyle: FontStyle.normal);
}
