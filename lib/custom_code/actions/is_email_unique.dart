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

Future<bool> isEmailUnique(String? email) async {
  // check if email exists in firebase database
  String? lowercaseEmail = email?.toLowerCase();
  final result = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: lowercaseEmail)
      .get();

  return result.docs.isEmpty;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
