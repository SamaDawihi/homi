import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/gallery/list_view_attached_file/list_view_attached_file_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'list_view_document_widget.dart' show ListViewDocumentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ListViewDocumentModel extends FlutterFlowModel<ListViewDocumentWidget> {
  ///  Local state fields for this component.

  bool viewMore = false;

  List<AttachmentRecord> attachment = [];
  void addToAttachment(AttachmentRecord item) => attachment.add(item);
  void removeFromAttachment(AttachmentRecord item) => attachment.remove(item);
  void removeAtIndexFromAttachment(int index) => attachment.removeAt(index);
  void insertAtIndexInAttachment(int index, AttachmentRecord item) =>
      attachment.insert(index, item);
  void updateAttachmentAtIndex(
          int index, Function(AttachmentRecord) updateFn) =>
      attachment[index] = updateFn(attachment[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ListViewDocument widget.
  List<AttachmentRecord>? attachments;
  // Models for ListViewAttachedFile dynamic component.
  late FlutterFlowDynamicModels<ListViewAttachedFileModel>
      listViewAttachedFileModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    listViewAttachedFileModels =
        FlutterFlowDynamicModels(() => ListViewAttachedFileModel());
  }

  @override
  void dispose() {
    listViewAttachedFileModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
