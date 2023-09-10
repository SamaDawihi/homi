import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/input_components/reset_password/reset_password_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginSignupPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? regNameErr = '';

  String regEmailErr = '';

  String regPasswordErr = '';

  String regPasswordConfirmationErr = '';

  String loginEmailErr = '';

  String loginPasswordErr = '';

  String? signUpErr = '';

  String? loginErr = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for re-enter widget.
  TextEditingController? reEnterController;
  late bool reEnterVisibility;
  String? Function(BuildContext, String?)? reEnterControllerValidator;
  // State field(s) for loginEmailAddress widget.
  TextEditingController? loginEmailAddressController;
  String? Function(BuildContext, String?)? loginEmailAddressControllerValidator;
  // State field(s) for loginPassword widget.
  TextEditingController? loginPasswordController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    reEnterVisibility = false;
    loginPasswordVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nameController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    reEnterController?.dispose();
    loginEmailAddressController?.dispose();
    loginPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
