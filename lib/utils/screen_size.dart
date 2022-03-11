import 'package:flutter/material.dart';

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width > 319.0 &&
    MediaQuery.of(context).size.width <= 599.0;

double formWidth(BuildContext context) =>
    60 / 100 * MediaQuery.of(context).size.width;

double cardWidth(BuildContext context) =>
    40 / 100 * MediaQuery.of(context).size.width;
