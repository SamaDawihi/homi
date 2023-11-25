import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/family_profile_pages_and_components/confirm_admin_change/confirm_admin_change_widget.dart';
import '/family_profile_pages_and_components/confirm_remove_member/confirm_remove_member_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_family_member_model.dart';
export 'list_view_family_member_model.dart';

class ListViewFamilyMemberWidget extends StatefulWidget {
  const ListViewFamilyMemberWidget({
    Key? key,
    required this.memberDoc,
  }) : super(key: key);

  final MemberRecord? memberDoc;

  @override
  _ListViewFamilyMemberWidgetState createState() =>
      _ListViewFamilyMemberWidgetState();
}

class _ListViewFamilyMemberWidgetState
    extends State<ListViewFamilyMemberWidget> {
  late ListViewFamilyMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewFamilyMemberModel());
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
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.memberDoc!.memberId!),
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
          final familYMemberContainerUsersRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 60.0,
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: StreamBuilder<FamilyRecord>(
                stream: FamilyRecord.getDocument(widget.memberDoc!.familyId!),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: valueOrDefault<Color>(
                              widget.memberDoc?.color,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 4.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            familYMemberContainerUsersRecord.photoUrl != null &&
                                    familYMemberContainerUsersRecord.photoUrl !=
                                        ''
                                ? familYMemberContainerUsersRecord.photoUrl
                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/homi-00t22e/assets/c8w026lm2m0v/userIcon.jpeg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    familYMemberContainerUsersRecord
                                        .displayName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  if (rowFamilyRecord.adminId ==
                                      familYMemberContainerUsersRecord
                                          .reference)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.solidStar,
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        size: 15.0,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      familYMemberContainerUsersRecord.email,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((rowFamilyRecord.adminId ==
                                  currentUserReference) &&
                              (rowFamilyRecord.adminId !=
                                  familYMemberContainerUsersRecord.reference))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ConfirmAdminChangeWidget(
                                        familyID: widget.memberDoc!.familyId!,
                                        userID: familYMemberContainerUsersRecord
                                            .reference,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.admin_panel_settings_rounded,
                                color: Color(0xFF433EA3),
                                size: 30.0,
                              ),
                            ),
                          if ((rowFamilyRecord.adminId ==
                                  currentUserReference) &&
                              (rowFamilyRecord.adminId !=
                                  familYMemberContainerUsersRecord.reference))
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: ConfirmRemoveMemberWidget(
                                        memberRef: widget.memberDoc?.reference,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.person_remove,
                                color: FlutterFlowTheme.of(context).error,
                                size: 26.0,
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
