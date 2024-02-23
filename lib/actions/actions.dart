import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/extra/dialog_you_have_been_removed/dialog_you_have_been_removed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future familyHasBeenDeletedNavigateToHome(BuildContext context) async {
  FFAppState().update(() {
    FFAppState().familyId = null;
  });

  context.goNamed('FamiliesManagement');
}

Future checkMemberExists(BuildContext context) async {
  int? number;

  number = await queryMemberRecordCount(
    queryBuilder: (memberRecord) => memberRecord
        .where(
          'memberId',
          isEqualTo: currentUserReference,
        )
        .where(
          'familyId',
          isEqualTo: FFAppState().familyId,
        ),
  );
  if (number == 0) {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: DialogYouHaveBeenRemovedWidget(),
        );
      },
    );

    return;
  } else {
    return;
  }
}
