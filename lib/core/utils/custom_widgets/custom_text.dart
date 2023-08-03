import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constrants/constrants.dart';

Widget customText({
  String? text,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  Color? color,
  int? maxLines,
  double? letterSpacing,
  TextOverflow? overflow,
  TextDecoration? decoration,
  required context,
}) {
  return Text(
    maxLines: maxLines,
    text!,
    style: TextStyle(
      fontFamily: fontFamily ?? GoogleFonts.lato().fontFamily,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      overflow: overflow,
      decoration: decoration,
      fontSize: fontSize ?? defultFontSize(context),
    ),
  );
}
