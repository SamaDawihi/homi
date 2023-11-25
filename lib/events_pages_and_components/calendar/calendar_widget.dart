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
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkMemberExists(context);
      setState(() {
        _model.focusDay = getCurrentTimestamp;
      });
      setState(() {
        _model.selectedDay = _model.focusDay;
      });
      _model.events = await queryEventRecordOnce(
        queryBuilder: (eventRecord) => eventRecord.where(
          'familyId',
          isEqualTo: FFAppState().familyId,
        ),
      );
      setState(() {
        _model.importedEvents = _model.events!.toList().cast<EventRecord>();
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              'EventAdd',
              queryParameters: {
                'selectedDate': serializeParam(
                  _model.selectedDay,
                  ParamType.DateTime,
                ),
              }.withoutNulls,
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.menu,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SideMenuWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '7dmf86h5' /* Calendar */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                while (true) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Color Already Picked'),
                                        content: Text(
                                            'The Color You Have Selected Is Already Picked Try Again.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  final _colorPickedColor =
                                      await showFFColorPicker(
                                    context,
                                    currentColor: _model.colorPicked ??=
                                        FlutterFlowTheme.of(context).primary,
                                    showRecentColors: true,
                                    allowOpacity: true,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    secondaryTextColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    primaryButtonBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    primaryButtonTextColor: Colors.white,
                                    primaryButtonBorderColor:
                                        Colors.transparent,
                                    displayAsBottomSheet:
                                        isMobileWidth(context),
                                  );

                                  if (_colorPickedColor != null) {
                                    safeSetState(() =>
                                        _model.colorPicked = _colorPickedColor);
                                  }
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/mainLogo.png',
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var _shouldSetState = false;
                          _model.googleEvents = await actions.getGoogleEvents(
                            context,
                            currentUserReference!,
                            FFAppState().familyId!,
                          );
                          _shouldSetState = true;
                          if (_model.googleEvents?.length == 0) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: DialogNoGoogleEventsFoundWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ConfirmAddingGoogleEventsWidget(
                                      events: _model.googleEvents!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                hoverColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                hoverIconColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 35.0,
                                ),
                                showLoadingIndicator: true,
                                onPressed: () {
                                  print('LinkGoogleIconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 6.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ya9nswq3' /* Get Google Events */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 15.0, 0.0, 10.0),
                              child: Text(
                                'This Day Event ${dateTimeFormat(
                                  'd/M h:mm a',
                                  _model.selectedDay,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder<List<EventRecord>>(
                    stream: queryEventRecord(
                      queryBuilder: (eventRecord) => eventRecord.where(
                        'familyId',
                        isEqualTo: FFAppState().familyId,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: SpinKitDualRing(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 10.0,
                            ),
                          ),
                        );
                      }
                      List<EventRecord> listViewEventRecordList =
                          snapshot.data!;
                      if (listViewEventRecordList.isEmpty) {
                        return ListViewEmptyEventsWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewEventRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewEventRecord =
                              listViewEventRecordList[listViewIndex];
                          return Visibility(
                            visible: functions.isDateInRange(
                                    _model.selectedDay!,
                                    listViewEventRecord.startDate!,
                                    listViewEventRecord.endDate!) &&
                                ((currentUserReference ==
                                        listViewEventRecord.createdBy) ||
                                    !(listViewEventRecord.isGoogleEvent &&
                                        listViewEventRecord
                                            .dontShareThisEvent)),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 6.0, 10.0),
                              child: wrapWithModel(
                                model:
                                    _model.listViewEventDisplayModels.getModel(
                                  listViewIndex.toString(),
                                  listViewIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ListViewEventDisplayWidget(
                                  key: Key(
                                    'Keywpy_${listViewIndex.toString()}',
                                  ),
                                  eventRef: listViewEventRecord.reference,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
