import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/recieved_invitation_container_widget.dart';
import '/components_of_families_management_page/my_family_container/my_family_container_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamiliesManagementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FamilyRecord? familyId;
  // Models for MyFamilyContainer dynamic component.
  late FlutterFlowDynamicModels<MyFamilyContainerModel> myFamilyContainerModels;
  // Models for RecievedInvitationContainer dynamic component.
  late FlutterFlowDynamicModels<RecievedInvitationContainerModel>
      recievedInvitationContainerModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    myFamilyContainerModels =
        FlutterFlowDynamicModels(() => MyFamilyContainerModel());
    recievedInvitationContainerModels =
        FlutterFlowDynamicModels(() => RecievedInvitationContainerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    myFamilyContainerModels.dispose();
    recievedInvitationContainerModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
