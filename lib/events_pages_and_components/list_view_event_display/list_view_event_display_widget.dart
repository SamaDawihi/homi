import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_event_display_model.dart';
export 'list_view_event_display_model.dart';

class ListViewEventDisplayWidget extends StatefulWidget {
  const ListViewEventDisplayWidget({
    Key? key,
    required this.eventRef,
  }) : super(key: key);

  final DocumentReference? eventRef;

  @override
  _ListViewEventDisplayWidgetState createState() =>
      _ListViewEventDisplayWidgetState();
}

class _ListViewEventDisplayWidgetState
    extends State<ListViewEventDisplayWidget> {
  late ListViewEventDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewEventDisplayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
      child: StreamBuilder<EventRecord>(
        stream: EventRecord.getDocument(widget.eventRef!),
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
          final eventDisplayEventRecord = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'EventDetails',
                queryParameters: {
                  'eventRef': serializeParam(
                    widget.eventRef,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFFE0E3E7),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: StreamBuilder<List<MemberRecord>>(
                        stream: queryMemberRecord(
                          queryBuilder: (memberRecord) => memberRecord
                              .where(
                                'memberId',
                                isEqualTo: eventDisplayEventRecord.createdBy,
                              )
                              .where(
                                'familyId',
                                isEqualTo: eventDisplayEventRecord.familyId,
                              ),
                          singleRecord: true,
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
                          List<MemberRecord> indicatorMemberRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final indicatorMemberRecord =
                              indicatorMemberRecordList.isNotEmpty
                                  ? indicatorMemberRecordList.first
                                  : null;
                          return Container(
                            width: 4.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: indicatorMemberRecord?.color,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          eventDisplayEventRecord.title,
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              'yMd',
                              eventDisplayEventRecord.startDate,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            'no start',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 11.0,
                                  ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'EventDetails',
                              queryParameters: {
                                'eventRef': serializeParam(
                                  widget.eventRef,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                        ),
                        if ((eventDisplayEventRecord.createdBy ==
                                currentUserReference) &&
                            eventDisplayEventRecord.isGoogleEvent)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (eventDisplayEventRecord.dontShareThisEvent) {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Share Event'),
                                              content: Text(
                                                  'Do You Want To Share This Event?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;

                                await widget.eventRef!
                                    .update(createEventRecordData(
                                  dontShareThisEvent: false,
                                ));
                                return;
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title:
                                              Text('Cancel Sharing The Event'),
                                          content: Text(
                                              'Do You Want To Cancel Sharing This Event?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Confirm'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;

                                await widget.eventRef!
                                    .update(createEventRecordData(
                                  dontShareThisEvent: true,
                                ));
                                return;
                              }
                            },
                            child: Icon(
                              Icons.remove_red_eye,
                              color: eventDisplayEventRecord.dontShareThisEvent
                                  ? FlutterFlowTheme.of(context).error
                                  : FlutterFlowTheme.of(context).success,
                              size: 24.0,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
