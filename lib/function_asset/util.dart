import 'package:flutter/material.dart';

double getHeightByPercentOfScreen(double percent, BuildContext context) {
  return MediaQuery.of(context).size.height * percent / 100;
}
