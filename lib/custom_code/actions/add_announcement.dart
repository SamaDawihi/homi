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

Future addAnnouncement(AnnouncementRecord announcement) async {
  // Add your function code here!
  try {
    await FirebaseFirestore.instance.collection('Announcement').add({
      'message': announcement.message,
      'image': announcement.image,
      'createdBy':
          announcement.createdBy, // Assuming createdBy is a user reference
      'createdAt': announcement.createdAt,
      'familyId':
          announcement.familyId, // Assuming familyId is a family reference
    });
    print('Announcement added successfully!');
  } catch (e) {
    print('Error adding announcement: $e');
  }
}
