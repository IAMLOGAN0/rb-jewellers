import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:material_color_generator/material_color_generator.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;

String rupeeSymbol = '₹';
String kronaSymbol = 'kr';
String tickSymbol = '✓';

void setScreenDimensions(BuildContext context) {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
}

final RegExp alphabetsWithSpaceRegex = RegExp(r"^[a-zA-Z .'-]+$"); /*RegExp(r'^[a-zA-Z ]+$');*/
final RegExp emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

final RegExp digitsInRangeRegex =
    RegExp(r'^(?:[0-9]|[1-9][0-9]|1[0-4][0-9]|150)$');

///
MaterialColor backgroundColor = generateMaterialColor(
    color: const Color(0xFFDC2729)); // Background color: #dc2729
MaterialColor textColorLight =
    generateMaterialColor(color: Colors.white); // Text color light: pure white
MaterialColor textColorDark = generateMaterialColor(
    color: const Color(0xFF494949)); // Text color dark: #494949

MaterialColor primaryColor =
    generateMaterialColor(color: Colors.white); // Primary color: pure white
MaterialColor primaryAccentColor = generateMaterialColor(
    color: const Color(0xFF494949)); // Primary accent color: #494949

MaterialColor secondaryColor = generateMaterialColor(
    color: const Color(0xFFFFB000)); // Secondary color: #ffb000
MaterialColor secondaryAccentColor = generateMaterialColor(
    color: const Color(0xFFDC2729)); // Secondary accent color: #dc2729

MaterialColor gradientStartColor = generateMaterialColor(
    color: const Color(0xFFE81F26)); // Gradient start color: #e81f26
MaterialColor gradientEndColor = generateMaterialColor(
    color: const Color(0xFFAC2831)); // Gradient end color: #ac2831

///
final appRadialGrdient = RadialGradient(
  center: Alignment.center,
  radius: 0.8,
  colors: [
    gradientStartColor,
    gradientEndColor,
  ],
);

///
///
///
TextStyle smallText =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textColorLight);
TextStyle smallTextBold =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textColorLight);

TextStyle standardText =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textColorLight);
TextStyle standardTextBold =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textColorLight);

TextStyle largeText =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textColorLight);
TextStyle largeTextBold =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColorLight);

TextStyle titleText =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: textColorLight);
TextStyle titleTextBold =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textColorLight);

TextStyle smallTextDark =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textColorDark);
TextStyle smallTextDarkBold =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textColorDark);

TextStyle standardTextDark =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: textColorDark);
TextStyle standardTextDarkBold =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textColorDark);

TextStyle largeTextDark =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: textColorDark);
TextStyle largeTextDarkBold =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textColorDark);

TextStyle titleTextDark =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: textColorDark);
TextStyle titleTextBoldDark =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textColorDark);

Widget thinSpace = const SizedBox(
  height: 5,
  width: 5,
);
Widget thickSpace = const SizedBox(
  height: 10,
  width: 10,
);

TimeOfDay stringToTimeOfDay(String timeString) {
  List<String> parts = timeString.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final DateTime now = DateTime.now();
  final DateTime dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

  final DateFormat formatter = DateFormat('h:mm a');
  final String formattedTime = formatter.format(dateTime);

  return formattedTime;
}

String formatTimeOfDayString(String timeOfDayString) {
  final TimeOfDay timeOfDay =
      TimeOfDay.fromDateTime(DateTime.parse('2023-05-31 $timeOfDayString'));
  final DateTime now = DateTime.now();
  final DateTime dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

  final DateFormat formatter = DateFormat('h:mm a');
  final String formattedTime = formatter.format(dateTime);

  return formattedTime;
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formattedDate = formatter.format(dateTime);
  return formattedDate;
}

void toastMessage(dynamic message,
    {ToastGravity gravity = ToastGravity.BOTTOM}) {
  log('toast: $message');
  Fluttertoast.showToast(
    backgroundColor: backgroundColor,
    msg: '$message',
    gravity: gravity,
  );
}

double getFileSizeInMb(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);

  log('${file.path}: $sizeInMb');
  return sizeInMb;
}
