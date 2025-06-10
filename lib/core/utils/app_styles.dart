import 'package:flutter/material.dart';

abstract class AppStyles {
  static const bold = TextStyle(fontWeight: FontWeight.bold);
  static const bold16 = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static const bold18 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const bold20 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  static const semiBold14 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static const semiMeduim16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const regular14 = TextStyle(fontSize: 14);
  static const regular12 = TextStyle(fontSize: 12);
  static const semiBold15 = TextStyle(fontWeight: FontWeight.w600, fontSize: 15);
  static const semiBold12 = TextStyle(fontWeight: FontWeight.w600, fontSize: 12);
  static const semiBold18 = TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
  static const medium15 = TextStyle(fontWeight: FontWeight.w500, fontSize: 15);
}
