import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/confiramtion_components/email_not_supported/email_not_supported_widget.dart';
import '/confiramtion_components/invite_sent_successfully/invite_sent_successfully_widget.dart';
import '/confiramtion_components/member_already_invited/member_already_invited_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InviteByEmailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // Stores action output result for [Custom Action - toLowerCaseAction] action in Button widget.
  String? emailToLow;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? numberOfInvitations;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? theUserWithTheSameEmail;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? numberOfTheMembersInTheFamilyWithSameName;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvitationRecord? invitationId;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
