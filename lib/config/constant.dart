import 'package:flutter/material.dart';

double sH(BuildContext context) => MediaQuery.of(context).size.height;
double sW(BuildContext context) => MediaQuery.of(context).size.width;

SizedBox space() {
  return const SizedBox(
    height: 40,
  );
}

ThemeData theme() => ThemeData(
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      color: Colors.grey[50],
    ));
