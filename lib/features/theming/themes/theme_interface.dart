import 'package:flutter/material.dart';

abstract interface class ThemeInterface {
  String get name;
  String get keyName;
  ThemeData get light;
  ThemeData get dark;
}
