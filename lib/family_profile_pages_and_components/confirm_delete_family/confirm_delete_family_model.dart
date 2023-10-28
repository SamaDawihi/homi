import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'confirm_delete_family_widget.dart' show ConfirmDeleteFamilyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmDeleteFamilyModel
    extends FlutterFlowModel<ConfirmDeleteFamilyWidget> {
  ///  Local state fields for this component.

  int loopIteration = 0;

  int? loopIteration2 = 0;

  int? loopIteration3 = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MemberRecord>? members;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<InvitationRecord>? invites;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<EventRecord>? events;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}