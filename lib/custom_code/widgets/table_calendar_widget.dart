// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart'; // Import the TableCalendar package
import '/custom_code/actions/index.dart' as actions;

// Import other dependencies and custom files here...

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({
    Key? key,
    this.width,
    this.height,
    required this.importedEvents,
    required this.selectedDay,
    required this.focusDay,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<EventRecord> importedEvents;
  final DateTime selectedDay;
  final DateTime focusDay;

  @override
  _TableCalendarWidgetState createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  Map<DateTime, List<EventStruct>> eventsMap = {};

  void getImportedEvents() {
    for (EventRecord event in widget.importedEvents) {
      DateTime startD = DateTime(
          event.startDate!.year, event.startDate!.month, event.startDate!.day);
      DateTime endD = DateTime(
          event.endDate!.year, event.endDate!.month, event.endDate!.day);

      if (eventsMap[startD] == null) eventsMap[startD] = [];
      eventsMap[startD]?.add(actions.toEventStruct(event));
      if (eventsMap[startD] != eventsMap[endD]) {
        if (eventsMap[endD] == null) eventsMap[endD] = [];
        eventsMap[endD]?.add(actions.toEventStruct(event));
      }
    }
  }

  List<EventStruct> _getEventsForDay(DateTime day) {
    DateTime newDay = DateTime(day.year, day.month, day.day);
    List<EventStruct> visibleEvents = [];
    if (eventsMap[newDay] != null) {
      for (EventStruct event in eventsMap[newDay]!) {
        if ((currentUserReference == event.createdBy) ||
            !(event.isGoogleEvent && event.dontShareThisEvent)) {
          visibleEvents.add(event);
        }
      }
    }
    return visibleEvents;
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _onSelectedDay(DateTime selectedDay, DateTime focusedDay) {
    if (!_isSameDay(widget.selectedDay, selectedDay)) {
      setState(() {
        widget.selectedDay = selectedDay;
        widget.focusDay = focusedDay;
        getImportedEvents(); // Call the function to update eventsMap
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getImportedEvents(); // Initialize eventsMap when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: widget.focusDay ?? DateTime.now(),
      firstDay: DateTime(2010, 1, 1),
      lastDay: DateTime(2040, 1, 1),
      calendarFormat: CalendarFormat.month,
      eventLoader: _getEventsForDay,
      selectedDayPredicate: (day) => _isSameDay(day, widget.selectedDay),
      onDaySelected: _onSelectedDay,
    );
  }
}
