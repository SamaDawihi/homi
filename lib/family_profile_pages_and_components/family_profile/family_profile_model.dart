import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/extra/family_loading/family_loading_widget.dart';
import '/extra/side_menu/side_menu_widget.dart';
import '/family_profile_pages_and_components/confirm_delete_family/confirm_delete_family_widget.dart';
import '/family_profile_pages_and_components/confirm_leave_family/confirm_leave_family_widget.dart';
import '/family_profile_pages_and_components/confirm_leave_last_member/confirm_leave_last_member_widget.dart';
import '/family_profile_pages_and_components/dialog_change_admin_to_leave_family/dialog_change_admin_to_leave_family_widget.dart';
import '/family_profile_pages_and_components/edit_family/edit_family_widget.dart';
import '/family_profile_pages_and_components/list_view_family_member/list_view_family_member_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/invitations_pages_and_components/invite_by_email/invite_by_email_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'family_profile_widget.dart' show FamilyProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamilyProfileModel extends FlutterFlowModel<FamilyProfileWidget> {
  ///  Local state fields for this page.

  bool edit = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFcmToken] action in FamilyProfile widget.
  String? fcmToken;
  // Models for ListViewFamilyMember dynamic component.
  late FlutterFlowDynamicModels<ListViewFamilyMemberModel>
      listViewFamilyMemberModels;
  // Stores action output result for [Firestore Query - Query a collection] action in LeaveFamilyButton widget.
  int? memberCount;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    listViewFamilyMemberModels =
        FlutterFlowDynamicModels(() => ListViewFamilyMemberModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewFamilyMemberModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
