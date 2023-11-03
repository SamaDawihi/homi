import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/extra/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks_pages_and_components/component_responsible_to_member/component_responsible_to_member_widget.dart';
import '/tasks_pages_and_components/confirm_delete_list/confirm_delete_list_widget.dart';
import '/tasks_pages_and_components/empty_task_component/empty_task_component_widget.dart';
import '/tasks_pages_and_components/input_component_add_task/input_component_add_task_widget.dart';
import '/tasks_pages_and_components/list_view_item/list_view_item_widget.dart';
import '/tasks_pages_and_components/no_members_message/no_members_message_widget.dart';
import 'list_view_widget.dart' show ListViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListViewModel extends FlutterFlowModel<ListViewWidget> {
  ///  Local state fields for this page.

  bool viewMore = false;

  List<DocumentReference> selectedMembers = [];
  void addToSelectedMembers(DocumentReference item) =>
      selectedMembers.add(item);
  void removeFromSelectedMembers(DocumentReference item) =>
      selectedMembers.remove(item);
  void removeAtIndexFromSelectedMembers(int index) =>
      selectedMembers.removeAt(index);
  void insertAtIndexInSelectedMembers(int index, DocumentReference item) =>
      selectedMembers.insert(index, item);
  void updateSelectedMembersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedMembers[index] = updateFn(selectedMembers[index]);

  int numberOfItms = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in ListView widget.
  ListRecord? forGettingAssignedMembers;
  // Stores action output result for [Firestore Query - Query a collection] action in ListView widget.
  int? numberOfItems;
  // Models for ComponentResponsibleToMember dynamic component.
  late FlutterFlowDynamicModels<ComponentResponsibleToMemberModel>
      componentResponsibleToMemberModels;
  List<ItemRecord>? listViewPreviousSnapshot;
  // Models for ListViewItem dynamic component.
  late FlutterFlowDynamicModels<ListViewItemModel> listViewItemModels;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentResponsibleToMemberModels =
        FlutterFlowDynamicModels(() => ComponentResponsibleToMemberModel());
    listViewItemModels = FlutterFlowDynamicModels(() => ListViewItemModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentResponsibleToMemberModels.dispose();
    listViewItemModels.dispose();
    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
