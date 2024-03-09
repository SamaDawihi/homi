import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/invitations_pages_and_components/confirm_accept_invitation/confirm_accept_invitation_widget.dart';
import '/invitations_pages_and_components/confirm_reject_invitation/confirm_reject_invitation_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_recieved_invitation_model.dart';
export 'list_view_recieved_invitation_model.dart';

class ListViewRecievedInvitationWidget extends StatefulWidget {
  const ListViewRecievedInvitationWidget({
    super.key,
    required this.invitationId,
  });

  final DocumentReference? invitationId;

  @override
  State<ListViewRecievedInvitationWidget> createState() =>
      _ListViewRecievedInvitationWidgetState();
}

class _ListViewRecievedInvitationWidgetState
    extends State<ListViewRecievedInvitationWidget> {
  late ListViewRecievedInvitationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewRecievedInvitationModel());
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
                              valueOrDefault<String>(
                                rowFamilyRecord.photoUrl,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/homi-00t22e/assets/6trprqqol39j/houseIcon.png',
                              ),
                              width: 48.0,
                              height: 48.0,
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
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ConfirmAcceptInvitationWidget(
                                    invitation:
                                        receivedInvitationContainerInvitationRecord,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
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
                            ).then((value) => safeSetState(() {}));
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
