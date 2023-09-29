import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/input_components/add_event_form/add_event_form_widget.dart';
import '/list_view_items/event_display/event_display_widget.dart';
import '/sprint1/side_menu/side_menu_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'calendar_widget.dart' show CalendarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarModel extends FlutterFlowModel<CalendarWidget> {
  ///  Local state fields for this page.

  DateTime? dateSelected;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Color? colorPicked;
  // Stores action output result for [Custom Action - getGoogleEvents] action in LinkGoogleIconButton widget.
  List<EventStruct>? googleEvents;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for EventDisplay dynamic component.
  late FlutterFlowDynamicModels<EventDisplayModel> eventDisplayModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    eventDisplayModels = FlutterFlowDynamicModels(() => EventDisplayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    eventDisplayModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
