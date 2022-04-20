import 'package:flutter/material.dart';

const double kDefaultPadding = 20.0;
const double kDefaultMargin = 10.0;

const Color kPrimaryColor = Color(0xFF457AF5);
const Color kSecondaryColor = Color(0xFFC0D0F4);
const Color kSuccessColor = Color(0xFF309F70);
const Color kDangerColor = Color(0xFFDC3545);
const Color kWarningColor = Color(0xFFFFC107);
const Color kInfoColor = Color(0xFF17a2b8);
const Color kDarkColor = Color(0xFF0F1B36);
const Color kLightColor = Color(0xFFFAFAFA);

List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    offset: const Offset(0.0, 2.0),
    blurRadius: 10.0,
    spreadRadius: 1.0,
  ),
];

const String baseUrl = "https://jsonplaceholder.typicode.com";
