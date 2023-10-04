// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getFcmToken() async {
  // Add your function code here!
  // String token = "Before";
  // FirebaseMessaging.instance.getToken().then((value) {
  //   token = value ?? "null";
  // });
  return await FirebaseMessaging.instance.getToken() ?? "NULL";
}
