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

Future<bool> addGoogleEvents(List<EventStruct> googleEvents) async {
  final firestore = FirebaseFirestore.instance;
  final eventCollection = firestore.collection('Event');

  for (final googleEvent in googleEvents) {
    // Get references to createdBy and familyId

    // Query to check if the event exists
    final querySnapshot = await eventCollection
        .where('title', isEqualTo: googleEvent.title)
        .where('startTime', isEqualTo: googleEvent.startTime)
        .where('endTime', isEqualTo: googleEvent.endTime)
        .where('createdBy', isEqualTo: googleEvent.createdBy)
        .where('familyId', isEqualTo: googleEvent.familyId)
        .get();

    // If there are no matching documents, add the event
    if (querySnapshot.docs.isEmpty) {
      Map<String, dynamic> eventData = {
        'title': googleEvent.title,
        'description': googleEvent.description,
        'createdBy': googleEvent.createdBy, // Storing the user reference
        'location': googleEvent.location,
        'startTime': googleEvent.startTime,
        'isAllDay': googleEvent.isAllDay,
        'familyId': googleEvent.familyId, // Storing the family reference
        'notifyBefore': googleEvent.notifyBefore,
        'notifyBeforeUnit': googleEvent.notifyBeforeUnit,
        'isGoogleEvent': googleEvent.isGoogleEvent,
        'endTime': googleEvent.endTime,
      };
      await eventCollection.add(eventData);
    } else {
      print('Event already exists!');
    }
  }
  return true; // Returns true after processing all the events
}
