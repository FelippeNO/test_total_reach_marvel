import 'package:flutter/cupertino.dart';
import 'dart:math';

class UIScale {
  static late double widthDevice;
  static late double heightDevice;
  static late double topDevicePadding;
  static late double diagonalDevice;

  static double width(double percentage) => (widthDevice / 100) * percentage;
  static double height(double percentage) => (heightDevice / 100) * percentage;
  static double textSize(double size) => (widthDevice / 1000) * size;

  static void init(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    widthDevice = screenSize.width;
    heightDevice = screenSize.height;
    topDevicePadding = MediaQuery.of(context).padding.top;
    diagonalDevice = sqrt(pow(widthDevice, 2) + pow(heightDevice, 2));
  }
}

class UIPadding {
  static double px8 = UIScale.width(2.05);
  static double px16 = UIScale.width(4.10);
  static double px24 = UIScale.width(6.15);
  static double px32 = UIScale.width(8.20);
  static double px40 = UIScale.width(10.25);
}
