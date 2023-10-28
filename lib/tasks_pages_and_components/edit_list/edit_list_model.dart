import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/extra/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_list_widget.dart' show EditListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditListModel extends FlutterFlowModel<EditListWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> membersToBeAdded = [];
  void addToMembersToBeAdded(DocumentReference item) =>
      membersToBeAdded.add(item);
  void removeFromMembersToBeAdded(DocumentReference item) =>
      membersToBeAdded.remove(item);
  void removeAtIndexFromMembersToBeAdded(int index) =>
      membersToBeAdded.removeAt(index);
  void insertAtIndexInMembersToBeAdded(int index, DocumentReference item) =>
      membersToBeAdded.insert(index, item);
  void updateMembersToBeAddedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      membersToBeAdded[index] = updateFn(membersToBeAdded[index]);

  String? titleErr = '';

  String? resMemberErr = '';

  int loopIteration = 0;

  int currentNumberOfFamilyMembers = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in EditList widget.
  int? numberOfFamilyMembers;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for responsabilitySwitch widget.
  bool? responsabilitySwitchValue;
  // Stores action output result for [Firestore Query - Query a collection] action in responsabilitySwitch widget.
  List<MemberRecord>? familyMembersDocs;
  // State field(s) for Checkbox widget.

  Map<MemberRecord, bool> checkboxValueMap = {};
  List<MemberRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MemberRecord? createdByMember;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    titleFocusNode?.dispose();
    titleController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    bottomNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
