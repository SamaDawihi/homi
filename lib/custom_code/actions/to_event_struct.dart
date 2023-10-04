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

EventStruct toEventStruct(EventRecord event) {
  return EventStruct(
      createdBy: event.createdBy,
      familyId: event.familyId,
      title: event.title ?? '',
      description: event.description ?? '',
      location: event.location ?? '',
      startDate: event.startDate,
      endDate: event.endDate,
      startTime: event.startTime,
      endTime: event.endTime,
      isAllDay: event.isAllDay,
      isGoogleEvent: event.isGoogleEvent,
      dontShareThisEvent: event.dontShareThisEvent,
      notifyBefore: event.notifyBefore,
      notifyBeforeUnit: event.notifyBeforeUnit);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
