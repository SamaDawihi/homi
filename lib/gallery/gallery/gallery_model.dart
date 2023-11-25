import '/backend/backend.dart';
import '/extra/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/gallery/list_view_document/list_view_document_widget.dart';
import 'gallery_widget.dart' show GalleryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GalleryModel extends FlutterFlowModel<GalleryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for ListViewDocument dynamic component.
  late FlutterFlowDynamicModels<ListViewDocumentModel> listViewDocumentModels;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewDocumentModels =
        FlutterFlowDynamicModels(() => ListViewDocumentModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listViewDocumentModels.dispose();
    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
