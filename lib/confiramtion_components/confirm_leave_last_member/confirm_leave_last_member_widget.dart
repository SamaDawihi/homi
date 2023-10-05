import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_leave_last_member_model.dart';
export 'confirm_leave_last_member_model.dart';

class ConfirmLeaveLastMemberWidget extends StatefulWidget {
  const ConfirmLeaveLastMemberWidget({
    Key? key,
    required this.familyID,
  }) : super(key: key);

  final DocumentReference? familyID;

  @override
  _ConfirmLeaveLastMemberWidgetState createState() =>
      _ConfirmLeaveLastMemberWidgetState();
}

class _ConfirmLeaveLastMemberWidgetState
    extends State<ConfirmLeaveLastMemberWidget> {
  late ConfirmLeaveLastMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmLeaveLastMemberModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 200.0,
          constraints: BoxConstraints(
            maxWidth: 530.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 19.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'o0jo7i2p' /* You are the last member. */,
                      ),
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'c6cz1bx5' /* If you leave, this family  and... */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 15.0,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'wxmv2yvx' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Color(0xFF555EBE),
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0xFF555EBE),
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.members = await queryMemberRecordOnce(
                          queryBuilder: (memberRecord) => memberRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (_model.loopIteration < _model.members!.length) {
                          await _model.members![_model.loopIteration].reference
                              .delete();
                          setState(() {
                            _model.loopIteration = _model.loopIteration + 1;
                          });
                        }
                        setState(() {
                          _model.loopIteration = 0;
                        });
                        _model.invites = await queryInvitationRecordOnce(
                          queryBuilder: (invitationRecord) =>
                              invitationRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (
                            _model.loopIteration2! < _model.invites!.length) {
                          await _model
                              .invites![_model.loopIteration2!].reference
                              .delete();
                          setState(() {
                            _model.loopIteration2 = _model.loopIteration2! + 1;
                          });
                        }
                        setState(() {
                          _model.loopIteration2 = 0;
                        });
                        _model.events = await queryEventRecordOnce(
                          queryBuilder: (eventRecord) => eventRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (_model.loopIteration3! < _model.events!.length) {
                          await _model.events![_model.loopIteration3!].reference
                              .delete();
                          setState(() {
                            _model.loopIteration3 = _model.loopIteration3! + 1;
                          });
                        }
                        setState(() {
                          _model.loopIteration3 = 0;
                        });

                        context.goNamed('FamiliesManagement');

                        await widget.familyID!.delete();
                        setState(() {
                          FFAppState().familyId = null;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Family Successfully Deleted!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'xg63hva4' /* OK */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF555EBE),
                        textStyle: FlutterFlowTheme.of(context).titleSmall,
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
