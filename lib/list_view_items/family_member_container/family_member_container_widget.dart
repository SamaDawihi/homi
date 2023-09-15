import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/confiramtion_components/confirm_admin_change/confirm_admin_change_widget.dart';
import '/confiramtion_components/confirm_remove_member/confirm_remove_member_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'family_member_container_model.dart';
export 'family_member_container_model.dart';

class FamilyMemberContainerWidget extends StatefulWidget {
  const FamilyMemberContainerWidget({
    Key? key,
    required this.memberId,
    required this.familyId,
    Color? color,
  })  : this.color = color ?? const Color(0xFF555EBE),
        super(key: key);

  final DocumentReference? memberId;
  final DocumentReference? familyId;
  final Color color;

  @override
  _FamilyMemberContainerWidgetState createState() =>
      _FamilyMemberContainerWidgetState();
}

class _FamilyMemberContainerWidgetState
    extends State<FamilyMemberContainerWidget> {
  late FamilyMemberContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FamilyMemberContainerModel());
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
        stream: UsersRecord.getDocument(widget.memberId!),
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
                stream: FamilyRecord.getDocument(widget.familyId!),
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
                            color: widget.color,
                            width: 4.0,
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
                                      child: ConfirmAdminChangeWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));
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
                                      child: ConfirmRemoveMemberWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Icon(
                                Icons.delete_forever_sharp,
                                color: Color(0xFFDE1B27),
                                size: 30.0,
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