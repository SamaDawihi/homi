import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tasks_pages_and_components/component_assained_to_member/component_assained_to_member_widget.dart';
import 'list_component_view_list_widget.dart' show ListComponentViewListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListComponentViewListModel
    extends FlutterFlowModel<ListComponentViewListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ComponentAssainedToMember dynamic component.
  late FlutterFlowDynamicModels<ComponentAssainedToMemberModel>
      componentAssainedToMemberModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentAssainedToMemberModels =
        FlutterFlowDynamicModels(() => ComponentAssainedToMemberModel());
  }

  void dispose() {
    componentAssainedToMemberModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
