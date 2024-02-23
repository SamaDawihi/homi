import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCZUO4itRIBg09o0pt2Tkoti5-bqLp4nuc",
            authDomain: "homi-pro.firebaseapp.com",
            projectId: "homi-pro",
            storageBucket: "homi-pro.appspot.com",
            messagingSenderId: "584197013310",
            appId: "1:584197013310:web:78e178ba9f21663d05b66f",
            measurementId: "G-2XWH3RL4LM"));
  } else {
    await Firebase.initializeApp();
  }
}
