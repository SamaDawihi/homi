import '/backend/backend.dart';
import '/extra/empty_list_component/empty_list_component_widget.dart';
import '/extra/side_menu/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks_pages_and_components/list_component_view_list/list_component_view_list_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'all_lists_widget.dart' show AllListsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllListsModel extends FlutterFlowModel<AllListsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for ListComponentViewList dynamic component.
  late FlutterFlowDynamicModels<ListComponentViewListModel>
      listComponentViewListModels1;
  // Models for ListComponentViewList dynamic component.
  late FlutterFlowDynamicModels<ListComponentViewListModel>
      listComponentViewListModels2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listComponentViewListModels1 =
        FlutterFlowDynamicModels(() => ListComponentViewListModel());
    listComponentViewListModels2 =
        FlutterFlowDynamicModels(() => ListComponentViewListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    listComponentViewListModels1.dispose();
    listComponentViewListModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
