import 'package:flutter/material.dart';
import 'package:music_app/consts/colors.dart';

ourStyle({family = "regular", double? size = 14, color = whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}
