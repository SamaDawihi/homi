import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'announcement_component_model.dart';
export 'announcement_component_model.dart';

class AnnouncementComponentWidget extends StatefulWidget {
  const AnnouncementComponentWidget({
    Key? key,
    required this.announcementId,
  }) : super(key: key);

  final DocumentReference? announcementId;

  @override
  _AnnouncementComponentWidgetState createState() =>
      _AnnouncementComponentWidgetState();
}

class _AnnouncementComponentWidgetState
    extends State<AnnouncementComponentWidget> {
  late AnnouncementComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnouncementComponentModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: StreamBuilder<AnnouncementRecord>(
        stream: AnnouncementRecord.getDocument(widget.announcementId!),
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
          final socialPost2AnnouncementRecord = snapshot.data!;
          return Container(
            width: 350.0,
            constraints: BoxConstraints(
              maxWidth: 350.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  offset: Offset(0.0, 1.0),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 4.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          socialPost2AnnouncementRecord.createdBy!),
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
                        final rowUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    rowUsersRecord.photoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 0.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        rowUsersRecord.displayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      StreamBuilder<FamilyRecord>(
                                        stream: FamilyRecord.getDocument(
                                            socialPost2AnnouncementRecord
                                                .familyId!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 10.0,
                                                height: 10.0,
                                                child: SpinKitDualRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 10.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final richTextFamilyRecord =
                                              snapshot.data!;
                                          return RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      richTextFamilyRecord.name,
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '6f04v8rp' /*  •  */,
                                                  ),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: dateTimeFormat(
                                                    'd/M H:mm',
                                                    socialPost2AnnouncementRecord
                                                        .createdAt!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (rowUsersRecord.reference ==
                                currentUserReference)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  ' The Announcement Has Been Deleted ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                action: SnackBarAction(
                                                  label: 'Undo',
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  onPressed: () async {
                                                    await actions
                                                        .addAnnouncement(
                                                      socialPost2AnnouncementRecord,
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                            await socialPost2AnnouncementRecord
                                                .reference
                                                .delete();
                                          },
                                          child: Icon(
                                            Icons.delete_forever,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                        ),
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
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 4.0, 12.0),
                          child: Text(
                            socialPost2AnnouncementRecord.message,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        if (socialPost2AnnouncementRecord.image != null &&
                            socialPost2AnnouncementRecord.image != '')
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              socialPost2AnnouncementRecord.image,
                              width: double.infinity,
                              height: 230.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}