import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/input_components/invite_by_email/invite_by_email_widget.dart';
import '/list_view_items/family_member_container/family_member_container_widget.dart';
import '/sprint1/side_menu/side_menu_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamilyProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String familyName = '\"\"';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in FamilyProfile widget.
  FamilyRecord? familyDocument;
  // Models for FamilyMemberContainer dynamic component.
  late FlutterFlowDynamicModels<FamilyMemberContainerModel>
      familyMemberContainerModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    familyMemberContainerModels =
        FlutterFlowDynamicModels(() => FamilyMemberContainerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    familyMemberContainerModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
