import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/confiramtion_components/confirm_delete_family/confirm_delete_family_widget.dart';
import '/confiramtion_components/confirm_leave_family/confirm_leave_family_widget.dart';
import '/confiramtion_components/confirm_leave_last_member/confirm_leave_last_member_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/information_components/change_admin_to_leave_family/change_admin_to_leave_family_widget.dart';
import '/input_components/invite_by_email/invite_by_email_widget.dart';
import '/list_view_items/family_member_container/family_member_container_widget.dart';
import '/sprint1/side_menu/side_menu_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'family_profile_widget.dart' show FamilyProfileWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamilyProfileModel extends FlutterFlowModel<FamilyProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFcmToken] action in FamilyProfile widget.
  String? fcmToken;
  // Models for FamilyMemberContainer dynamic component.
  late FlutterFlowDynamicModels<FamilyMemberContainerModel>
      familyMemberContainerModels;
  // Stores action output result for [Firestore Query - Query a collection] action in LeaveFamilyButton widget.
  int? memberCount;

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
