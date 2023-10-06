import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future familyHasBeenDeletedNavigateToHome(BuildContext context) async {
  FFAppState().update(() {
    FFAppState().familyId = null;
  });

  context.goNamed('FamiliesManagement');
}