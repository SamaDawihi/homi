import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/invitations_pages_and_components/dialog_email_not_supported/dialog_email_not_supported_widget.dart';
import '/invitations_pages_and_components/dialog_invite_email_sent_successfully/dialog_invite_email_sent_successfully_widget.dart';
import '/invitations_pages_and_components/dialog_invite_sent_successfully/dialog_invite_sent_successfully_widget.dart';
import '/invitations_pages_and_components/dialog_member_already_invited/dialog_member_already_invited_widget.dart';
import '/invitations_pages_and_components/dialog_member_invited_already_member/dialog_member_invited_already_member_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'invite_by_email_model.dart';
export 'invite_by_email_model.dart';

class InviteByEmailWidget extends StatefulWidget {
  const InviteByEmailWidget({
    super.key,
    this.familyId,
  });

  final DocumentReference? familyId;

  @override
  State<InviteByEmailWidget> createState() => _InviteByEmailWidgetState();
}

class _InviteByEmailWidgetState extends State<InviteByEmailWidget>
    with TickerProviderStateMixin {
  late InviteByEmailModel _model;

  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 300.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InviteByEmailModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, -2.0),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (animationsMap['columnOnActionTriggerAnimation'] !=
                              null) {
                            await animationsMap[
                                    'columnOnActionTriggerAnimation']!
                                .controller
                                .forward(from: 0.0);
                          }
                          context.safePop();
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 490),
                          curve: Curves.easeInOut,
                          width: 60.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '48xbquf9' /* Invite a member */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '6ma2tj06' /* Enter the family member's emai... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.emailAddressController,
                      focusNode: _model.emailAddressFocusNode,
                      autofocus: true,
                      autofillHints: [AutofillHints.email],
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.send,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        hintText: FFLocalizations.of(context).getText(
                          'oo8xo3t7' /* Enter email */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context).labelLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 20.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.emailAddressControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 44.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (functions.checkIfTextMatchRegExp(
                              _model.emailAddressController.text,
                              '^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$')) {
                            _model.numberOfInvitations =
                                await queryInvitationRecordCount(
                              queryBuilder: (invitationRecord) =>
                                  invitationRecord
                                      .where(
                                        'invitedEmail',
                                        isEqualTo:
                                            functions.toLowerCaseFunction(_model
                                                .emailAddressController.text),
                                      )
                                      .where(
                                        'familyId',
                                        isEqualTo: widget.familyId,
                                      )
                                      .where(
                                        'status',
                                        isEqualTo: 'Pending',
                                      ),
                            );
                            _shouldSetState = true;
                            if (_model.numberOfInvitations == 0) {
                              _model.noOfUsersWithTheSameEmail =
                                  await queryUsersRecordCount(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'email',
                                  isEqualTo: functions.toLowerCaseFunction(
                                      _model.emailAddressController.text),
                                ),
                              );
                              _shouldSetState = true;
                              if (_model.noOfUsersWithTheSameEmail != 0) {
                                _model.theUserWithSameEmail =
                                    await queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'email',
                                    isEqualTo: functions.toLowerCaseFunction(
                                        _model.emailAddressController.text),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;
                                _model.noOfUsersInFamilyWithSameEmail =
                                    await queryMemberRecordCount(
                                  queryBuilder: (memberRecord) => memberRecord
                                      .where(
                                        'memberId',
                                        isEqualTo: _model
                                            .theUserWithSameEmail?.reference,
                                      )
                                      .where(
                                        'familyId',
                                        isEqualTo: widget.familyId,
                                      ),
                                );
                                _shouldSetState = true;
                                if (_model.noOfUsersInFamilyWithSameEmail !=
                                    0) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child:
                                            DialogMemberInvitedAlreadyMemberWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: DialogMemberAlreadyInvitedWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: DialogEmailNotSupportedWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));

                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_model.theUserWithSameEmail != null) {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: DialogInviteSentSuccessfullyWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            await SendEmailCall.call(
                              toEmail: _model.emailAddressController.text,
                              subject:
                                  'You have been invited to join a family in Homi!',
                              content:
                                  'Hello there! You have been invited by ${currentUserEmail} to join their family in Homi! Download the app now to join their family and start managing your familial activities!',
                            );
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child:
                                      DialogInviteEmailSentSuccessfullyWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          }

                          var invitationRecordReference =
                              InvitationRecord.collection.doc();
                          await invitationRecordReference
                              .set(createInvitationRecordData(
                            invitedEmail: functions.toLowerCaseFunction(
                                _model.emailAddressController.text),
                            familyId: widget.familyId,
                            status: 'Pending',
                            createdTime: getCurrentTimestamp,
                          ));
                          _model.invitationId =
                              InvitationRecord.getDocumentFromData(
                                  createInvitationRecordData(
                                    invitedEmail: functions.toLowerCaseFunction(
                                        _model.emailAddressController.text),
                                    familyId: widget.familyId,
                                    status: 'Pending',
                                    createdTime: getCurrentTimestamp,
                                  ),
                                  invitationRecordReference);
                          _shouldSetState = true;
                          Navigator.pop(context);
                          if (_shouldSetState) setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'k9in9k2q' /* Invite */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF555EBE),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).animateOnActionTrigger(
        animationsMap['columnOnActionTriggerAnimation']!,
      ),
    );
  }
}
