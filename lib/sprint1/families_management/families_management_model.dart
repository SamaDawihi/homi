import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/list_view_items/emptyfamilies/emptyfamilies_widget.dart';
import '/list_view_items/emptyinvitations/emptyinvitations_widget.dart';
import '/list_view_items/my_family_container/my_family_container_widget.dart';
import '/list_view_items/recieved_invitation_container/recieved_invitation_container_widget.dart';
import '/sprint1/side_menu/side_menu_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamiliesManagementModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DocumentReference? familyRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FamilyRecord? createdFamily;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MemberRecord? createdFamilyAdmin;
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
