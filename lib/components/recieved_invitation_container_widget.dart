import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 8.0),
      child: StreamBuilder<InvitationRecord>(
        stream: InvitationRecord.getDocument(widget.invitationId!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
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
                  child: Row(
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
                              child: StreamBuilder<FamilyRecord>(
                                stream: FamilyRecord.getDocument(
                                    receivedInvitationContainerInvitationRecord
                                        .familyId!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final textFamilyRecord = snapshot.data!;
                                  return Text(
                                    valueOrDefault<String>(
                                      textFamilyRecord.name,
                                      'Family Name',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFF029083),
                          borderRadius: 16.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.check,
                            color: Color(0xFF029083),
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Welcome to the Family'),
                                  content: Text(
                                      'choose a color that will appear to your family'),
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
                                  Color(0xFFFFCF2E),
                              showRecentColors: true,
                              allowOpacity: false,
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
                              setState(() => _model.colorPicked =
                                  _colorPickedColor.withOpacity(1.0));
                            }

                            await MemberRecord.collection
                                .doc()
                                .set(createMemberRecordData(
                                  memberId: currentUserReference,
                                  familyId:
                                      receivedInvitationContainerInvitationRecord
                                          .familyId,
                                  color: _model.colorPicked,
                                ));

                            await widget.invitationId!
                                .update(createInvitationRecordData(
                              status: 'Accepted',
                            ));

                            context.pushNamed(
                              'FamilyProfile',
                              queryParameters: {
                                'familyId': serializeParam(
                                  receivedInvitationContainerInvitationRecord
                                      .familyId,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Color(0xFFD50000),
                          borderRadius: 16.0,
                          borderWidth: 1.0,
                          buttonSize: 35.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFD50000),
                            size: 20.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
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
