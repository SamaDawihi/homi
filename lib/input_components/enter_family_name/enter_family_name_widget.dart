import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'enter_family_name_model.dart';
export 'enter_family_name_model.dart';

class EnterFamilyNameWidget extends StatefulWidget {
  const EnterFamilyNameWidget({Key? key}) : super(key: key);

  @override
  _EnterFamilyNameWidgetState createState() => _EnterFamilyNameWidgetState();
}

class _EnterFamilyNameWidgetState extends State<EnterFamilyNameWidget>
    with TickerProviderStateMixin {
  late EnterFamilyNameModel _model;

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
    _model = createModel(context, () => EnterFamilyNameModel());

    _model.familynameController ??= TextEditingController();
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
      alignment: AlignmentDirectional(1.00, -1.00),
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
                        '7wt8nq94' /* Enter a Family Name */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'q689li65' /* Please enter a name for your f... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: _model.familynameController,
                      autofocus: true,
                      autofillHints: [AutofillHints.email],
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.send,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                        hintText: FFLocalizations.of(context).getText(
                          '0ag0ttbi' /* Enter the family name */,
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
                      validator: _model.familynameControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 44.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var familyRecordReference =
                            FamilyRecord.collection.doc();
                        await familyRecordReference.set(createFamilyRecordData(
                          name: _model.familynameController.text,
                          adminId: currentUserReference,
                          color: FlutterFlowTheme.of(context).primary,
                          createdTime: getCurrentTimestamp,
                        ));
                        _model.createdFamily = FamilyRecord.getDocumentFromData(
                            createFamilyRecordData(
                              name: _model.familynameController.text,
                              adminId: currentUserReference,
                              color: FlutterFlowTheme.of(context).primary,
                              createdTime: getCurrentTimestamp,
                            ),
                            familyRecordReference);

                        var memberRecordReference =
                            MemberRecord.collection.doc();
                        await memberRecordReference.set(createMemberRecordData(
                          memberId: currentUserReference,
                          familyId: _model.createdFamily?.reference,
                          color: FlutterFlowTheme.of(context).warning,
                          createdTime: getCurrentTimestamp,
                        ));
                        _model.createdFamilyAdmin =
                            MemberRecord.getDocumentFromData(
                                createMemberRecordData(
                                  memberId: currentUserReference,
                                  familyId: _model.createdFamily?.reference,
                                  color: FlutterFlowTheme.of(context).warning,
                                  createdTime: getCurrentTimestamp,
                                ),
                                memberRecordReference);
                        FFAppState().update(() {
                          FFAppState().familyId =
                              _model.createdFamily?.reference;
                        });

                        context.goNamed('FamilyProfile');

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'ogbc1zm7' /* Create Family */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
