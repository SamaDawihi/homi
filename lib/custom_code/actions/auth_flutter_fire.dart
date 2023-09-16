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

import 'package:firebase_auth/firebase_auth.dart';

Future<String> authFlutterFire(
  String emailAddress,
  String password,
  String messageInvalidEmail,
  String messageWrongPassword,
  String messageUserNotFound,
) async {
  String returnAuth = "valid";
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
  } on FirebaseAuthException catch (e) {
    // POSSIBLE ERRORS
    //
    // invalid-email
    // wrong-password
    // user-not-found
    //
    switch (e.code) {
      case 'invalid-email':
        returnAuth = messageInvalidEmail;
        break;
      case 'wrong-password':
        returnAuth = messageWrongPassword;
        break;
      case 'user-not-found':
        returnAuth = messageUserNotFound;
        break;
    }
  }
  if (returnAuth == "valid") {
    FirebaseAuth.instance.signOut();
  }
  return returnAuth;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
