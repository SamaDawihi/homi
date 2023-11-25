import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_my_family_model.dart';
export 'list_view_my_family_model.dart';

class ListViewMyFamilyWidget extends StatefulWidget {
  const ListViewMyFamilyWidget({
    Key? key,
    required this.familyId,
  }) : super(key: key);

  final DocumentReference? familyId;

  @override
  _ListViewMyFamilyWidgetState createState() => _ListViewMyFamilyWidgetState();
}

class _ListViewMyFamilyWidgetState extends State<ListViewMyFamilyWidget> {
  late ListViewMyFamilyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewMyFamilyModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
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
          final myFamilyContaionerFamilyRecord = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().update(() {
                FFAppState().familyId = widget.familyId;
              });

              context.goNamed('FamilyProfile');
            },
            child: Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x34090F13),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          myFamilyContaionerFamilyRecord.photoUrl,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/homi-00t22e/assets/6trprqqol39j/houseIcon.png',
                        ),
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 9.0),
                      child: Text(
                        myFamilyContaionerFamilyRecord.name,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        FFAppState().update(() {
                          FFAppState().familyId = widget.familyId;
                        });

                        context.goNamed('FamilyProfile');
                      },
                      text: FFLocalizations.of(context).getText(
                        '4t0j9wzp' /* Enter */,
                      ),
                      options: FFButtonOptions(
                        height: 20.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF555EBE),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
