// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addGoogleEvents(List<EventStruct> googleEvents) async {
  // Add your function code here!
  final firestore = FirebaseFirestore.instance;
  final eventCollection = firestore.collection('Event');

  for (final googleEvent in googleEvents) {
    // Query to check if the event exists
    final querySnapshot = await eventCollection
        .where('title', isEqualTo: googleEvent.title)
        .where('startDate', isEqualTo: googleEvent.startDate)
        .where('startTime', isEqualTo: googleEvent.startTime)
        .where('endDate', isEqualTo: googleEvent.endDate)
        .where('createdBy', isEqualTo: googleEvent.createdBy)
        .where('familyId', isEqualTo: googleEvent.familyId)
        .get();

    // If there are no matching documents, add the event
    if (querySnapshot.docs.isEmpty) {
      // Calculate the notification time by subtracting the reminder time and unit from startTime
      DateTime startTime = googleEvent.startTime!;
      Duration reminderDuration;

      switch (googleEvent.notifyBeforeUnit) {
        case 'Minutes':
          reminderDuration = Duration(minutes: googleEvent.notifyBefore);
          break;
        case 'Hours':
          reminderDuration = Duration(hours: googleEvent.notifyBefore);
          break;
        case 'Days':
          reminderDuration = Duration(days: googleEvent.notifyBefore);
          break;
        default:
          // Handle unsupported units or defaults to 0 duration
          reminderDuration = Duration();
      }

      DateTime notificationTime = startTime.subtract(reminderDuration);

      // Compare the notification time with the current time
      DateTime currentTime = DateTime.now();
      bool isNotificationSent = !notificationTime.isAfter(currentTime);

      Map<String, dynamic> eventData = {
        'title': googleEvent.title,
        'description': googleEvent.description,
        'createdBy': googleEvent.createdBy,
        'location': googleEvent.location,
        'startDate': googleEvent.startDate,
        'startTime': googleEvent.startTime,
        'endDate': googleEvent.endDate,
        'isAllDay': googleEvent.isAllDay,
        'familyId': googleEvent.familyId,
        'notifyBefore': googleEvent.notifyBefore,
        'notifyBeforeUnit': googleEvent.notifyBeforeUnit,
        'isGoogleEvent': googleEvent.isGoogleEvent,
        'dontShareThisEvent': googleEvent.dontShareThisEvent,
        'notificationSent':
            isNotificationSent, // Set notificationSent based on comparison
        'notificationTime': googleEvent.notificationTime,
      };
      await eventCollection.add(eventData);
    } else {
      print('Event already exists!');
    }
  }
}
