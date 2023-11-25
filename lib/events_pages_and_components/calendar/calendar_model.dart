import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/events_pages_and_components/confirm_adding_google_events/confirm_adding_google_events_widget.dart';
import '/events_pages_and_components/dialog_no_google_events_found/dialog_no_google_events_found_widget.dart';
import '/events_pages_and_components/list_view_empty_events/list_view_empty_events_widget.dart';
import '/events_pages_and_components/list_view_event_display/list_view_event_display_widget.dart';
import '/extra/side_menu/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'calendar_widget.dart' show CalendarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarModel extends FlutterFlowModel<CalendarWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDay;

  DateTime? focusDay;

  List<EventRecord> importedEvents = [];
  void addToImportedEvents(EventRecord item) => importedEvents.add(item);
  void removeFromImportedEvents(EventRecord item) =>
      importedEvents.remove(item);
  void removeAtIndexFromImportedEvents(int index) =>
      importedEvents.removeAt(index);
  void insertAtIndexInImportedEvents(int index, EventRecord item) =>
      importedEvents.insert(index, item);
  void updateImportedEventsAtIndex(int index, Function(EventRecord) updateFn) =>
      importedEvents[index] = updateFn(importedEvents[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Calendar widget.
  List<EventRecord>? events;
  Color? colorPicked;
  // Stores action output result for [Custom Action - getGoogleEvents] action in Row widget.
  List<EventStruct>? googleEvents;
  // Models for ListViewEventDisplay dynamic component.
  late FlutterFlowDynamicModels<ListViewEventDisplayModel>
      listViewEventDisplayModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listViewEventDisplayModels =
        FlutterFlowDynamicModels(() => ListViewEventDisplayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listViewEventDisplayModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
