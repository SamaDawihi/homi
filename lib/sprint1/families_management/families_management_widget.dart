import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/list_view_items/emptyfamilies/emptyfamilies_widget.dart';
import '/list_view_items/emptyinvitations/emptyinvitations_widget.dart';
import '/list_view_items/my_family_container/my_family_container_widget.dart';
import '/list_view_items/recieved_invitation_container/recieved_invitation_container_widget.dart';
import '/sprint1/side_menu/side_menu_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'families_management_model.dart';
export 'families_management_model.dart';

class FamiliesManagementWidget extends StatefulWidget {
  const FamiliesManagementWidget({Key? key}) : super(key: key);

  @override
  _FamiliesManagementWidgetState createState() =>
      _FamiliesManagementWidgetState();
}

class _FamiliesManagementWidgetState extends State<FamiliesManagementWidget> {
  late FamiliesManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FamiliesManagementModel());
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFFF1F4F8),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
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
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SideMenuWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            's3d9qvh1' /* Homi */,
                          ),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFF555EBE),
                            fontWeight: FontWeight.w800,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
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
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9ukj6vmr' /* welcome to homi, choose whethe... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var familyRecordReference =
                                FamilyRecord.collection.doc();
                            await familyRecordReference
                                .set(createFamilyRecordData(
                              name: 'Family ${random_data.randomString(
                                4,
                                4,
                                true,
                                true,
                                true,
                              )}',
                              adminId: currentUserReference,
                              color: FlutterFlowTheme.of(context).primary,
                              createdTime: getCurrentTimestamp,
                            ));
                            _model.createdFamily =
                                FamilyRecord.getDocumentFromData(
                                    createFamilyRecordData(
                                      name: 'Family ${random_data.randomString(
                                        4,
                                        4,
                                        true,
                                        true,
                                        true,
                                      )}',
                                      adminId: currentUserReference,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      createdTime: getCurrentTimestamp,
                                    ),
                                    familyRecordReference);

                            var memberRecordReference =
                                MemberRecord.collection.doc();
                            await memberRecordReference
                                .set(createMemberRecordData(
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
                                      color:
                                          FlutterFlowTheme.of(context).warning,
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
                            'wb1iebtz' /* Create a family */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF555EBE),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5dfbp8ya' /* My Families */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: StreamBuilder<List<MemberRecord>>(
                    stream: queryMemberRecord(
                      queryBuilder: (memberRecord) => memberRecord
                          .where('memberId', isEqualTo: currentUserReference)
                          .orderBy('created_time'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                          ),
                        );
                      }
                      List<MemberRecord> listViewMemberRecordList =
                          snapshot.data!;
                      if (listViewMemberRecordList.isEmpty) {
                        return Center(
                          child: Container(
                            width: 500.0,
                            height: 200.0,
                            child: EmptyfamiliesWidget(),
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listViewMemberRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMemberRecord =
                              listViewMemberRecordList[listViewIndex];
                          return wrapWithModel(
                            model: _model.myFamilyContainerModels.getModel(
                              listViewIndex.toString(),
                              listViewIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: MyFamilyContainerWidget(
                              key: Key(
                                'Keyow7_${listViewIndex.toString()}',
                              ),
                              familyId: listViewMemberRecord.familyId!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 7.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'r2qmfx8y' /* List of invitations */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 44.0),
                  child: StreamBuilder<List<InvitationRecord>>(
                    stream: queryInvitationRecord(
                      queryBuilder: (invitationRecord) => invitationRecord
                          .where('invitedEmail', isEqualTo: currentUserEmail)
                          .where('status', isEqualTo: 'Pending')
                          .orderBy('created_time', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 25.0,
                            ),
                          ),
                        );
                      }
                      List<InvitationRecord> listViewInvitationRecordList =
                          snapshot.data!;
                      if (listViewInvitationRecordList.isEmpty) {
                        return Container(
                          width: 500.0,
                          height: 200.0,
                          child: EmptyinvitationsWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewInvitationRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewInvitationRecord =
                              listViewInvitationRecordList[listViewIndex];
                          return wrapWithModel(
                            model: _model.recievedInvitationContainerModels
                                .getModel(
                              listViewIndex.toString(),
                              listViewIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: RecievedInvitationContainerWidget(
                              key: Key(
                                'Keyw8j_${listViewIndex.toString()}',
                              ),
                              invitationId: listViewInvitationRecord.reference,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
