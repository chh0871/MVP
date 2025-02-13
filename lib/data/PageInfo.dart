import 'package:flutter/material.dart';

class PageInfo {
  PageInfo({
    required this.title,
    required this.icon, 
    required this.page,
  });

  final String title;
  final Icon icon;
  final Widget page;
}