import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle titleStyle({Color?color, double? size, FontWeight? weight}){
    return TextStyle(
      fontSize: size ?? 24,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? AppColors.darkColor,
    );
  }
  static TextStyle bodyStyle({Color?color, double? size, FontWeight? weight}){
    return TextStyle(
      fontSize: size ?? 16,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }
  static TextStyle smallStyle({Color?color, double? size, FontWeight? weight}){
    return TextStyle(
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }
}