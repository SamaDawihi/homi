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

Future addEventNotification(
  String token,
  EventRecord eventRecord,
) async {
  // Add your function code here!
  try {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'content-type': 'application/json',
        'authorization':
            'key=AAAAiATa_z4:APA91bFcGK7kEwkzjNo59yTC_wA6KgwQCK6q0GKF8n1uDciLY5RieiTtej9C7zyF2IYNGiifiFWPCbuYEBbp_opfE6gdzUfa4HCgIlYLtjDsYC5sNnAT6VsiM0lZv6kfsBCqGxRfhZi5'
      },
      body: jsonEncode(
        <String, dynamic>{
          'priority': 'high',
          'data': <string, dynamic>{
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "status": 'done',
            "body": eventRecord.description,
            "title": eventRecord.title
          },
          "notification": <String, dynamic>{
            "title": eventRecord.title,
            "body": eventRecord.description,
            "android_channel_id": "channelID"
          },
          "to": token
        },
      ),
    );
  } catch (e) {
    print(e);
  }
}
