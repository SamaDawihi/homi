import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/extra/side_menu/side_menu_widget.dart';
import '/families_management_pages_and_components/input_component_enter_family_name/input_component_enter_family_name_widget.dart';
import '/families_management_pages_and_components/list_view_empty_families/list_view_empty_families_widget.dart';
import '/families_management_pages_and_components/list_view_my_family/list_view_my_family_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/invitations_pages_and_components/list_view_empty_invitations/list_view_empty_invitations_widget.dart';
import '/invitations_pages_and_components/list_view_recieved_invitation/list_view_recieved_invitation_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'families_management_widget.dart' show FamiliesManagementWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FamiliesManagementModel
    extends FlutterFlowModel<FamiliesManagementWidget> {
  ///  Local state fields for this page.

  DocumentReference? familyRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFcmToken] action in FamiliesManagement widget.
  String? fcmToken;
  // Models for ListViewMyFamily dynamic component.
  late FlutterFlowDynamicModels<ListViewMyFamilyModel> listViewMyFamilyModels;
  // Models for ListViewRecievedInvitation dynamic component.
  late FlutterFlowDynamicModels<ListViewRecievedInvitationModel>
      listViewRecievedInvitationModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    listViewMyFamilyModels =
        FlutterFlowDynamicModels(() => ListViewMyFamilyModel());
    listViewRecievedInvitationModels =
        FlutterFlowDynamicModels(() => ListViewRecievedInvitationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewMyFamilyModels.dispose();
    listViewRecievedInvitationModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
