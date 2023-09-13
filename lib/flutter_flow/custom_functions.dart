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
