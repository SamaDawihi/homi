import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'add_event_form_widget.dart' show AddEventFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEventFormModel extends FlutterFlowModel<AddEventFormWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  String? _titleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zsconjlh' /* Title is required. */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?![\\s\\d!@#\$%^&*()_+{}\\[\\]:;<>,.?~\\\\-=|\\/]+\$).+')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'kod5xuao' /* Title can not contain only whi... */,
      );
    }
    return null;
  }

  // State field(s) for location widget.
  TextEditingController? locationController;
  String? Function(BuildContext, String?)? locationControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for AllDaySwitch widget.
  bool? allDaySwitchValue;
  DateTime? datePicked3;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for NotificationSwitch widget.
  bool? notificationSwitchValue;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j7cezyuq' /* Notification time is required. */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventRecord? notifyOnTimeEvent;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventRecord? notifyBeforeEvent;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleControllerValidator = _titleControllerValidator;
    textController4Validator = _textController4Validator;
  }

  void dispose() {
    titleController?.dispose();
    locationController?.dispose();
    descriptionController?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
