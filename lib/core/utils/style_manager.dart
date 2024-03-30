//  getTextstyle

import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
  required FontWeight fontWeight,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}

//  regular textstyle
TextStyle getRegularTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
  );
}

//  light
TextStyle getLightTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
  );
}

//  medium
TextStyle getMediumTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
  );
}

// bold
TextStyle getBoldTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
  );
}

//  semibold
TextStyle getSemiBoldTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
  );
}

TextStyle getStrongBoldTextStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: FontWeightManager.strongBold,
  );
}
