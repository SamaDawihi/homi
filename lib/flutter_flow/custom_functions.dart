import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkIfTextMatchRegExp(
  String text,
  String regEx,
) {
  RegExp reg = RegExp(regEx);
  return reg.hasMatch(text);
}

String toLowerCaseFunction(String inputString) {
  return inputString.toLowerCase();
}

bool checkPasswordLength(String password) {
  return password.length >= 6;
}

bool isColorUsedFunction(
  List<MemberRecord> familyMember,
  Color pickedColor,
) {
  for (int i = 0; i < familyMember.length; i++) {
    if (pickedColor == familyMember[i].color) return true;
  }
  return false;
}

bool? checkPasswordString(String password) {
  bool hasLetters = false;
  bool hasNumbers = false;
  for (var i = 0; i < password.length; i++) {
    if (password[i].contains(RegExp(r'[a-zA-Z]'))) {
      hasLetters = true;
    }
    if (password[i].contains(RegExp(r'[0-9]'))) {
      hasNumbers = true;
    }
  }
  if (hasLetters && hasNumbers) {
    return true;
  }
  return false;
}

bool isDateInRange(
  DateTime selectedDate,
  DateTime startDate,
  DateTime endDate,
) {
  if (endDate == null) {
    return startDate.year == selectedDate.year &&
        startDate.month == selectedDate.month &&
        startDate.day == selectedDate.day;
  } else {
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate) ||
        (currentDate.year == endDate.year &&
            currentDate.month == endDate.month &&
            currentDate.day == endDate.day)) {
      if (currentDate.year == selectedDate.year &&
          currentDate.month == selectedDate.month &&
          currentDate.day == selectedDate.day) {
        return true;
      }
      currentDate = currentDate.add(Duration(days: 1));
    }
  }
  return false;
}

String trimAndCollapseSpaces(String text) {
  return text.replaceAll(RegExp(r'\s+'), ' ').trim();
}

String newCustomFunction() {
  return "/users/lqfCawyxEnRHZdnZZw7FD5zIpIK2";
}

DateTime dateTimeToDateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime calculateNotificationTime(
  bool isAllDay,
  bool notifyOnTime,
  DateTime startDate,
  DateTime startTime,
  int notifyBefore,
  String notifyBeforeUnit,
) {
  DateTime notificationTime = startDate;

  if (!isAllDay) {
    // Adjust for non-all-day events
    notificationTime = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      startTime.hour,
      startTime.minute,
    );
  }

  if (!notifyOnTime) {
    // Adjust notification time based on notification before settings
    if (notifyBeforeUnit == "Days") {
      notificationTime =
          notificationTime.subtract(Duration(days: notifyBefore));
    } else if (notifyBeforeUnit == "Hours") {
      notificationTime =
          notificationTime.subtract(Duration(hours: notifyBefore));
    } else if (notifyBeforeUnit == "Minutes") {
      notificationTime =
          notificationTime.subtract(Duration(minutes: notifyBefore));
    }
  }

  return notificationTime;
}

bool addedEventIsInThePast(
  DateTime startDate,
  DateTime startTime,
  bool isAllDay,
) {
  if (isAllDay)
    return startDate.isBefore(DateTime.now());
  else {
    DateTime eventTime = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      startTime.hour,
      startTime.minute,
    );
    return eventTime.isBefore(DateTime.now());
  }
}
