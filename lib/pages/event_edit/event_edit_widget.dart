import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_edit_model.dart';
export 'event_edit_model.dart';

class EventEditWidget extends StatefulWidget {
  const EventEditWidget({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventRecord? event;

  @override
  _EventEditWidgetState createState() => _EventEditWidgetState();
}

class _EventEditWidgetState extends State<EventEditWidget> {
  late EventEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.startDate = widget.event?.startDate;
        _model.startTime = widget.event?.startTime;
        _model.endDate = widget.event?.endDate;
      });
    });

    _model.titleController ??= TextEditingController(text: widget.event?.title);
    _model.locationController ??=
        TextEditingController(text: widget.event?.location);
    _model.descriptionController ??=
        TextEditingController(text: widget.event?.description);
    _model.textController4 ??=
        TextEditingController(text: widget.event?.notifyBefore?.toString());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                Icons.arrow_back,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                context.pop();
                                setState(() {
                                  _model.startTime = null;
                                  _model.startDate = null;
                                  _model.endDate = null;
                                });
                              },
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'yywc6jcb' /* Edit Event */,
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 14.0, 14.0, 14.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.titleController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ix5shetm' /* Event Title* */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.titleControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.locationController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'yzk7stxn' /* Location */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    maxLength: 50,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model
                                        .locationControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 14.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked1Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: _model.startDate!,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePicked1Date != null) {
                                              safeSetState(() {
                                                _model.datePicked1 = DateTime(
                                                  _datePicked1Date.year,
                                                  _datePicked1Date.month,
                                                  _datePicked1Date.day,
                                                );
                                              });
                                            }
                                            if (_model.datePicked1! >
                                                _model.endDate!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Start Date cannot be afterEnd Date ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              return;
                                            } else {
                                              setState(() {
                                                _model.startDate =
                                                    _model.datePicked1;
                                              });
                                              return;
                                            }
                                          },
                                          child: Container(
                                            width: 130.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  dateTimeFormat(
                                                    'yMd',
                                                    _model.startDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.date_range,
                                                    color: Color(0xFF555EBE),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final _datePicked2Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: _model.endDate!,
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2050),
                                          );

                                          if (_datePicked2Date != null) {
                                            safeSetState(() {
                                              _model.datePicked2 = DateTime(
                                                _datePicked2Date.year,
                                                _datePicked2Date.month,
                                                _datePicked2Date.day,
                                              );
                                            });
                                          }
                                          if (_model.startDate! >
                                              _model.datePicked2!) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'End Date cannot be before Start Date.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent4,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                            );
                                            return;
                                          } else {
                                            setState(() {
                                              _model.endDate =
                                                  _model.datePicked2;
                                            });
                                            return;
                                          }
                                        },
                                        child: Container(
                                          width: 130.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                  'yMd',
                                                  _model.endDate,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.date_range,
                                                  color: Color(0xFF555EBE),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '92ynmofy' /* All Day Event */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Switch.adaptive(
                                        value: _model.allDaySwitchValue ??=
                                            widget.event!.isAllDay,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .allDaySwitchValue = newValue!);
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor: Color(0xFF555EBE),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 14.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked3Time =
                                                await showTimePicker(
                                              context: context,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      _model.startTime!),
                                            );
                                            if (_datePicked3Time != null) {
                                              safeSetState(() {
                                                _model.datePicked3 = DateTime(
                                                  _model.startTime!.year,
                                                  _model.startTime!.month,
                                                  _model.startTime!.day,
                                                  _datePicked3Time.hour,
                                                  _datePicked3Time.minute,
                                                );
                                              });
                                            }
                                            setState(() {
                                              _model.startTime =
                                                  _model.datePicked3;
                                            });
                                          },
                                          child: Container(
                                            width: 130.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: !valueOrDefault<bool>(
                                                _model.allDaySwitchValue,
                                                true,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    dateTimeFormat(
                                                      'jm',
                                                      _model.startTime,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons.access_time,
                                                      color: Color(0xFF555EBE),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.descriptionController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'vm4w5w5m' /* Description here... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    maxLines: 5,
                                    maxLength: 255,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model
                                        .descriptionControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wtpwjh7t' /* Notify On Time Of Event */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Switch.adaptive(
                                      value: _model.notificationSwitchValue ??=
                                          widget.event!.notifyOnTime,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.notificationSwitchValue =
                                                newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).success,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      inactiveThumbColor: Color(0xFF555EBE),
                                    ),
                                  ],
                                ),
                                if (!_model.notificationSwitchValue!)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '9yp5vtc1' /* Notification Time* */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Source Sans Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 22.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController4,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'yg122c2d' /* Before... */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                maxLength: 2,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController4Validator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ),
                                          ),
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??= widget
                                                  .event?.notifyBeforeUnit,
                                            ),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ngyvwwy9' /* Minutes */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5nk6im9w' /* Hours */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pmnqgu25' /* Days */,
                                              )
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            width: 145.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'g02kws35' /* Min/hour/Day */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (functions.trimAndCollapseSpaces(
                                                        _model.titleController
                                                            .text) !=
                                                    null &&
                                                functions.trimAndCollapseSpaces(
                                                        _model.titleController
                                                            .text) !=
                                                    '') {
                                              if ((_model.startDate != null) &&
                                                  (_model.endDate != null)) {
                                                if (_model.startDate! <=
                                                    _model.endDate!) {
                                                  if (!_model.allDaySwitchValue!
                                                      ? (_model.startTime !=
                                                          null)
                                                      : true) {
                                                    if (_model
                                                        .notificationSwitchValue!) {
                                                      await widget
                                                          .event!.reference
                                                          .update(
                                                              createEventRecordData(
                                                        title: functions
                                                            .trimAndCollapseSpaces(
                                                                _model
                                                                    .titleController
                                                                    .text),
                                                        description: functions
                                                            .trimAndCollapseSpaces(
                                                                _model
                                                                    .descriptionController
                                                                    .text),
                                                        createdBy:
                                                            currentUserReference,
                                                        location: functions
                                                            .trimAndCollapseSpaces(
                                                                _model
                                                                    .locationController
                                                                    .text),
                                                        startTime: !_model
                                                                .allDaySwitchValue!
                                                            ? _model.startTime
                                                            : _model.startDate,
                                                        isAllDay: _model
                                                            .allDaySwitchValue,
                                                        familyId: FFAppState()
                                                            .familyId,
                                                        notifyBefore:
                                                            valueOrDefault<int>(
                                                          int.tryParse(_model
                                                              .textController4
                                                              .text),
                                                          0,
                                                        ),
                                                        notifyBeforeUnit:
                                                            valueOrDefault<
                                                                String>(
                                                          _model.dropDownValue,
                                                          'Days',
                                                        ),
                                                        isGoogleEvent: false,
                                                        startDate:
                                                            _model.startDate,
                                                        dontShareThisEvent:
                                                            false,
                                                        endDate: _model.endDate,
                                                        notificationSent: functions
                                                            .addedEventIsInThePast(
                                                                _model
                                                                    .startDate!,
                                                                !_model.allDaySwitchValue!
                                                                    ? _model
                                                                        .startTime!
                                                                    : _model
                                                                        .startDate!,
                                                                _model
                                                                    .allDaySwitchValue!),
                                                        notifyOnTime: true,
                                                        notificationTime: functions.calculateNotificationTime(
                                                            _model
                                                                .allDaySwitchValue!,
                                                            _model
                                                                .notificationSwitchValue!,
                                                            _model.startDate!,
                                                            !_model.allDaySwitchValue!
                                                                ? _model
                                                                    .startTime!
                                                                : _model
                                                                    .startDate!,
                                                            int.parse(_model
                                                                .textController4
                                                                .text),
                                                            _model
                                                                .dropDownValue!),
                                                      ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Event Edited Successfully.',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .success,
                                                        ),
                                                      );

                                                      context
                                                          .goNamed('Calendar');

                                                      return;
                                                    } else {
                                                      if ((_model.textController4
                                                                      .text !=
                                                                  null &&
                                                              _model.textController4
                                                                      .text !=
                                                                  '') &&
                                                          (_model.dropDownValue !=
                                                                  null &&
                                                              _model.dropDownValue !=
                                                                  '')) {
                                                        await widget
                                                            .event!.reference
                                                            .update(
                                                                createEventRecordData(
                                                          title: functions
                                                              .trimAndCollapseSpaces(
                                                                  _model
                                                                      .titleController
                                                                      .text),
                                                          description: functions
                                                              .trimAndCollapseSpaces(
                                                                  _model
                                                                      .descriptionController
                                                                      .text),
                                                          createdBy:
                                                              currentUserReference,
                                                          location: functions
                                                              .trimAndCollapseSpaces(
                                                                  _model
                                                                      .locationController
                                                                      .text),
                                                          startTime: !_model
                                                                  .allDaySwitchValue!
                                                              ? _model.startTime
                                                              : _model
                                                                  .startDate,
                                                          isAllDay: _model
                                                              .allDaySwitchValue,
                                                          familyId: FFAppState()
                                                              .familyId,
                                                          notifyBefore: int
                                                              .tryParse(_model
                                                                  .textController4
                                                                  .text),
                                                          notifyBeforeUnit:
                                                              _model
                                                                  .dropDownValue,
                                                          isGoogleEvent: false,
                                                          startDate:
                                                              _model.startDate,
                                                          dontShareThisEvent:
                                                              false,
                                                          endDate:
                                                              _model.endDate,
                                                          notificationSent: functions.addedEventIsInThePast(
                                                              _model.startDate!,
                                                              !_model.allDaySwitchValue!
                                                                  ? _model
                                                                      .startTime!
                                                                  : _model
                                                                      .startDate!,
                                                              _model
                                                                  .allDaySwitchValue!),
                                                          notifyOnTime: false,
                                                          notificationTime: functions.calculateNotificationTime(
                                                              _model
                                                                  .allDaySwitchValue!,
                                                              _model
                                                                  .notificationSwitchValue!,
                                                              _model.startDate!,
                                                              !_model.allDaySwitchValue!
                                                                  ? _model
                                                                      .startTime!
                                                                  : _model
                                                                      .startDate!,
                                                              int.parse(_model
                                                                  .textController4
                                                                  .text),
                                                              _model
                                                                  .dropDownValue!),
                                                        ));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Event Edited Successfully.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                          ),
                                                        );

                                                        context.goNamed(
                                                            'Calendar');

                                                        return;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Enter the Notify Before Value And Select The Unit.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Make Sure To Select A Start Date Or Disable All Day Switch',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Start Date Must Be After End Date.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                  return;
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Make Sure To Enter Start And End Date',
                                                      style: TextStyle(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                                return;
                                              }
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Enter The Title.',
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                              return;
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '0fr2vbr9' /* Edit */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF555EBE),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          'Source Sans Pro',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.bottomNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: BottomNavBarWidget(
                    currentPage: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
