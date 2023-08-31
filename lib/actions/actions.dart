import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future checkIfFamilyIdIsAssigned(
  BuildContext context, {
  required DocumentReference? familyId,
}) async {
  if (familyId?.id == '') {
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Choose Family First'),
              content: Text('Choose Family First'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        ) ??
        false;
    context.safePop();
    return;
  } else {
    return;
  }
}
