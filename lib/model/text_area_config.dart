// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAreaConfig {
  Color color;
  double top;
  double heigth;
  double width;
  double left;
  bool isActive;
  ValueNotifier<double>? rotateAmount = ValueNotifier(0);
  FocusNode focusNode = FocusNode();
  String? text;
  TextStyle textStyle = GoogleFonts.gabriela();
  final id = UniqueKey();
  TextAreaConfig({
    this.color = Colors.black,
    this.text = "",
    this.isActive = false,
    this.top = 50,
    this.left = 50,
    this.heigth = 55,
    this.width = 130,
  });

  TextAreaConfig copyWith({
    Color? color,
    double? top,
    double? left,
    double? heigth,
    double? width,
    bool? isActive,
    String? text,
  }) {
    return TextAreaConfig(
      color: color ?? this.color,
      top: top ?? this.top,
      left: left ?? this.left,
      isActive: isActive ?? this.isActive,
      text: text ?? this.text,
      heigth: heigth ?? this.heigth,
      width: width ?? this.width,
    );
  }
}
