import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_delete_family_model.dart';
export 'confirm_delete_family_model.dart';

class ConfirmDeleteFamilyWidget extends StatefulWidget {
  const ConfirmDeleteFamilyWidget({
    Key? key,
    required this.familyID,
  }) : super(key: key);

  final DocumentReference? familyID;

  @override
  _ConfirmDeleteFamilyWidgetState createState() =>
      _ConfirmDeleteFamilyWidgetState();
}

class _ConfirmDeleteFamilyWidgetState extends State<ConfirmDeleteFamilyWidget> {
  late ConfirmDeleteFamilyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmDeleteFamilyModel());
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
                        'b9i6l4nb' /* Delete Family */,
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
                          'x5w3r1st' /* Are you sure you want to delet... */,
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
                          'j7lp4ydv' /* Cancel */,
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
                        context.goNamed('FamiliesManagement');

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
                        _model.lists = await queryListRecordOnce(
                          queryBuilder: (listRecord) => listRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (_model.deleteListsIteration <
                            _model.lists!.length) {
                          _model.listItems = await queryItemRecordOnce(
                            queryBuilder: (itemRecord) => itemRecord.where(
                              'belongTo',
                              isEqualTo: _model
                                  .lists?[_model.deleteListsIteration]
                                  ?.reference,
                            ),
                          );
                          while (_model.deleteItemsIteration <
                              _model.listItems!.length) {
                            await _model.listItems![_model.deleteItemsIteration]
                                .reference
                                .delete();
                            setState(() {
                              _model.deleteItemsIteration =
                                  _model.deleteItemsIteration + 1;
                            });
                          }
                          setState(() {
                            _model.deleteItemsIteration = 0;
                          });
                          await _model
                              .lists![_model.deleteListsIteration].reference
                              .delete();
                          setState(() {
                            _model.deleteListsIteration =
                                _model.deleteListsIteration + 1;
                          });
                        }
                        setState(() {
                          _model.deleteListsIteration = 0;
                        });
                        _model.announcements =
                            await queryAnnouncementRecordOnce(
                          queryBuilder: (announcementRecord) =>
                              announcementRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (_model.loopAnnouncement <
                            _model.announcements!.length) {
                          await _model
                              .announcements![_model.loopAnnouncement].reference
                              .delete();
                          setState(() {
                            _model.loopAnnouncement =
                                _model.loopAnnouncement + 1;
                          });
                        }
                        _model.documents = await queryDocumentRecordOnce(
                          queryBuilder: (documentRecord) =>
                              documentRecord.where(
                            'familyId',
                            isEqualTo: widget.familyID,
                          ),
                        );
                        while (
                            _model.loopDocuments < _model.documents!.length) {
                          await _model
                              .documents![_model.loopDocuments].reference
                              .delete();
                          setState(() {
                            _model.loopDocuments = _model.loopDocuments + 1;
                          });
                        }
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
                        'fxzpg0fz' /* OK */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
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
