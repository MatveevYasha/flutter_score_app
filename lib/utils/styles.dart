import 'package:flutter/material.dart';

class Style {
  static Color colorRed = const Color.fromARGB(255, 249, 57, 44);
  static Color colorGreen = const Color.fromARGB(255, 21, 220, 51);
  static Color colorYellow = const Color.fromARGB(255, 227, 213, 23);
  static Color colorBlack = const Color.fromARGB(255, 0, 0, 0);
  static Color colorGrey = const Color.fromARGB(255, 154, 151, 151);
  static Color colorWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color colorGreyScore = const Color.fromARGB(142, 255, 255, 255);
  static Color colorGreyPlayerName = const Color.fromARGB(155, 65, 64, 64);
  static Color colorPurple = const Color.fromARGB(255, 156, 22, 156);

  static TextStyle score = TextStyle(
    fontSize: 160,
    color: Style.colorWhite,
  );
  static TextStyle teamName = TextStyle(
    fontSize: 26,
    color: Style.colorWhite,
    fontWeight: FontWeight.w600,
  );
  static TextStyle playerName = TextStyle(
    fontSize: 18,
    color: Style.colorGreyPlayerName,
  );
  static TextStyle playerScore = TextStyle(
    fontSize: 60,
    color: Style.colorBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textH2 = TextStyle(
    fontSize: 28,
    color: Style.colorBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textH2W = TextStyle(
    fontSize: 28,
    color: Style.colorWhite,
    fontWeight: FontWeight.w600,
  );
}
