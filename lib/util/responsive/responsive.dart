import 'package:flutter/material.dart';

double percentHeight(BuildContext context, double percent) {
  return MediaQuery.of(context).size.width * percent;
}
