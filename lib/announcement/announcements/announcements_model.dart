import '/announcement/announcement_component/announcement_component_widget.dart';
import '/backend/backend.dart';
import '/extra/side_menu/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'announcements_widget.dart' show AnnouncementsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnnouncementsModel extends FlutterFlowModel<AnnouncementsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for AnnouncementComponent dynamic component.
  late FlutterFlowDynamicModels<AnnouncementComponentModel>
      announcementComponentModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    announcementComponentModels =
        FlutterFlowDynamicModels(() => AnnouncementComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    announcementComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
