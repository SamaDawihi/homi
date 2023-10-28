import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_component_enter_family_name_widget.dart'
    show InputComponentEnterFamilyNameWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputComponentEnterFamilyNameModel
    extends FlutterFlowModel<InputComponentEnterFamilyNameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Familyname widget.
  FocusNode? familynameFocusNode;
  TextEditingController? familynameController;
  String? Function(BuildContext, String?)? familynameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FamilyRecord? createdFamily;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MemberRecord? createdFamilyAdmin;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    familynameFocusNode?.dispose();
    familynameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
