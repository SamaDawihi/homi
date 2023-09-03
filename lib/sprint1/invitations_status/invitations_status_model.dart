import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/list_view_items/invitation_status/invitation_status_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitationsStatusModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for InvitationStatus dynamic component.
  late FlutterFlowDynamicModels<InvitationStatusModel> invitationStatusModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    invitationStatusModels =
        FlutterFlowDynamicModels(() => InvitationStatusModel());
  }

  void dispose() {
    unfocusNode.dispose();
    invitationStatusModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
