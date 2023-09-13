import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/confiramtion_components/confirm_reject_invitation/confirm_reject_invitation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recieved_invitation_container_model.dart';
export 'recieved_invitation_container_model.dart';

class RecievedInvitationContainerWidget extends StatefulWidget {
  const RecievedInvitationContainerWidget({
    Key? key,
    required this.invitationId,
  }) : super(key: key);

  final DocumentReference? invitationId;

  @override
  _RecievedInvitationContainerWidgetState createState() =>
      _RecievedInvitationContainerWidgetState();
}

class _RecievedInvitationContainerWidgetState
    extends State<RecievedInvitationContainerWidget> {
  late RecievedInvitationContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecievedInvitationContainerModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 8.0),
      child: StreamBuilder<InvitationRecord>(
        stream: InvitationRecord.getDocument(widget.invitationId!),
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
          final receivedInvitationContainerInvitationRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 90.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x32000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: StreamBuilder<FamilyRecord>(
                    stream: FamilyRecord.getDocument(
                        receivedInvitationContainerInvitationRecord.familyId!),
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
                      final rowFamilyRecord = snapshot.data!;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(26.0),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 9.0, 0.0, 0.0),
                                  child: Text(
                                    rowFamilyRecord.name,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: FutureBuilder<UsersRecord>(
                                    future: UsersRecord.getDocumentOnce(
                                        rowFamilyRecord.adminId!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 10.0,
                                            height: 10.0,
                                            child: SpinKitDualRing(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 10.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final textUsersRecord = snapshot.data!;
                                      return Text(
                                        'Invited By ${textUsersRecord.displayName}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 10.0, 2.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0x00029083),
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 38.0,
                          fillColor: Color(0x00E0E3E7),
                          hoverColor: Color(0xFF03ED58),
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.check,
                            color: Color(0xFF03ED58),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('welcome to the family'),
                                  content: Text(
                                      'choose the color that will represent you in this family'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('pick a color'),
                                    ),
                                  ],
                                );
                              },
                            );
                            final _colorPickedColor = await showFFColorPicker(
                              context,
                              currentColor: _model.colorPicked ??=
                                  FlutterFlowTheme.of(context).primary,
                              showRecentColors: true,
                              allowOpacity: true,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              secondaryTextColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              primaryButtonBackgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              primaryButtonTextColor: Colors.white,
                              primaryButtonBorderColor: Colors.transparent,
                              displayAsBottomSheet: isMobileWidth(context),
                            );

                            if (_colorPickedColor != null) {
                              setState(
                                  () => _model.colorPicked = _colorPickedColor);
                            }

                            await MemberRecord.collection
                                .doc()
                                .set(createMemberRecordData(
                                  memberId: currentUserReference,
                                  familyId:
                                      receivedInvitationContainerInvitationRecord
                                          .familyId,
                                  color: _model.colorPicked,
                                  createdTime: getCurrentTimestamp,
                                ));

                            await widget.invitationId!
                                .update(createInvitationRecordData(
                              status: 'Accepted',
                            ));
                            FFAppState().update(() {
                              FFAppState().familyId =
                                  receivedInvitationContainerInvitationRecord
                                      .familyId;
                            });

                            context.goNamed('FamilyProfile');

                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Color Already Picked'),
                                  content: Text(
                                      'The Color You Have Selected Is Already Picked Try Again.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Color Already Picked'),
                                  content: Text(
                                      'The Color You Have Selected Is Already Picked Try Again.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0x00029083),
                          borderRadius: 16.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          fillColor: Color(0x00029083),
                          hoverColor: Color(0xFFD50000),
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFD50000),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ConfirmRejectInvitationWidget(
                                    invitationId: widget.invitationId!,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
