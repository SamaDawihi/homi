import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/gallery/photocard/photocard_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'gallery_widget.dart' show GalleryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GalleryModel extends FlutterFlowModel<GalleryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for photocard component.
  late PhotocardModel photocardModel1;
  // Model for photocard component.
  late PhotocardModel photocardModel2;
  // Model for photocard component.
  late PhotocardModel photocardModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photocardModel1 = createModel(context, () => PhotocardModel());
    photocardModel2 = createModel(context, () => PhotocardModel());
    photocardModel3 = createModel(context, () => PhotocardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    photocardModel1.dispose();
    photocardModel2.dispose();
    photocardModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
