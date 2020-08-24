import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final String title;
  final Widget customWidget;


  FloatingNavbarItem({
    @required this.title,
    this.customWidget = const SizedBox(),
  });
}
