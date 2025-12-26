import 'package:flutter/material.dart';

class SpinnerFieldStyle {
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsets? padding;

  const SpinnerFieldStyle({
    this.fillColor,
    this.textStyle,
    this.hintStyle,
    this.borderRadius,
    this.borderSide,
    this.padding,
  });
}

class SpinnerSearchFieldStyle {
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsets? padding;

  const SpinnerSearchFieldStyle({
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.borderRadius,
    this.borderSide,
    this.padding,
  });
}
