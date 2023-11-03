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

Future addItem(ItemRecord item) async {
  // Add your function code here!
  try {
    await FirebaseFirestore.instance.collection('Item').add({
      'name': item.name,
      'doneBy': item.doneBy,
      'done': item.done,
      'belongTo': item.belongTo,
    });
    print('Item added successfully!');
  } catch (e) {
    print('Error adding item: $e');
  }
}
