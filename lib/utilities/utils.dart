import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

late Size screenSize;

const Color kBackgroundColor = Color(0xFFF5F5DC);

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('EEEE dd MMM');
  return formatter.format(date);
}

Future<bool> isFirstAppLaunch() async {
  final box = Hive.box('settings'); // Open or use the 'settings' box
  bool? launch = box.get('launch', defaultValue: false); // Retrieve 'launch'

  if (launch == false) {
    await box.put('launch', true); // Set 'launch' to true for the first time
    return true; // Indicating first launch
  }
  return false; // Not the first launch
}
