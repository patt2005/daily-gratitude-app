import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Size screenSize;

const Color kBackgroundColor = Color(0xFFF5F5DC);

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE dd MMM');
  return formatter.format(date);
}

Future<bool> isFirstAppLaunch() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? launch = preferences.getBool("launch");
  if (launch == null) {
    await preferences.setBool("launch", true);
    return true;
  }
  return false;
}
