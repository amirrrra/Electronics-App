import 'package:flutter/material.dart';

class SectionProfileModel {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  SectionProfileModel({required this.icon, required this.label, this.onTap});
}
