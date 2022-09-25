import 'package:flutter/material.dart';

extension Hexcolor on Color {
  static Color hexString(String string) {
    string = string.replaceAll("#", "");
    if(string.length == 6) {
      string = "FF" + string;
    }
    return Color(int.parse(string, radix: 16));
  }
}

class ColorManager {
  static Color primary = Hexcolor.hexString("#F63E02");
  static Color primary2 = Hexcolor.hexString("#550527");

}