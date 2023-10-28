import '/backend/backend.dart';
import '/extra/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/invitations_pages_and_components/empty_status/empty_status_widget.dart';
import '/invitations_pages_and_components/list_view_invitation_status/list_view_invitation_status_widget.dart';
import 'invitations_status_widget.dart' show InvitationsStatusWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitationsStatusModel extends FlutterFlowModel<InvitationsStatusWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for ListViewInvitationStatus dynamic component.
  late FlutterFlowDynamicModels<ListViewInvitationStatusModel>
      listViewInvitationStatusModels;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewInvitationStatusModels =
        FlutterFlowDynamicModels(() => ListViewInvitationStatusModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listViewInvitationStatusModels.dispose();
    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
