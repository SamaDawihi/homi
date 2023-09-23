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

import 'index.dart'; // Imports other custom actions

import 'package:google_sign_in/google_sign_in.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis/calendar/v3.dart';

Future<List<EventStruct>> getGoogleEvents(
  DocumentReference createdBy,
  DocumentReference familyId,
) async {
  // create new instance of EventStruct Data Type
  List<EventStruct> events = [];
  final googleSignIn =
      GoogleSignIn(scopes: [CalendarApi.calendarEventsReadonlyScope]);
  GoogleSignInAccount? _currentUser;
  _currentUser = await googleSignIn.signIn();

  final info = EventStruct(title: "got into listener");
  events.add(info);

  if (_currentUser != null) {
    final authClient = await googleSignIn.authenticatedClient();
    final calendarApi = CalendarApi(authClient!);

    final eventsList = await calendarApi.events.list('primary');
    if (eventsList.items != null) {
      for (final event in eventsList.items!) {
        final eventStruct = EventStruct(
            createdBy: createdBy,
            familyId: familyId,
            title: event.summary,
            //description: event.description,
            location: event.location,
            startTime: event.start?.dateTime ?? event.start?.date,
            endTime: event.end?.dateTime ?? event.end?.date,
            isGoogleEvent: true);
        events.add(eventStruct);
      }
    }
  }
  return events;
}
