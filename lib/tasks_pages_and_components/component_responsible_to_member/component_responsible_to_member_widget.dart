import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_responsible_to_member_model.dart';
export 'component_responsible_to_member_model.dart';

class ComponentResponsibleToMemberWidget extends StatefulWidget {
  const ComponentResponsibleToMemberWidget({
    super.key,
    required this.memberRef,
  });

  final DocumentReference? memberRef;

  @override
  State<ComponentResponsibleToMemberWidget> createState() =>
      _ComponentResponsibleToMemberWidgetState();
}

class _ComponentResponsibleToMemberWidgetState
    extends State<ComponentResponsibleToMemberWidget> {
  late ComponentResponsibleToMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentResponsibleToMemberModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MemberRecord>(
      stream: MemberRecord.getDocument(widget.memberRef!),
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
        final rowMemberRecord = snapshot.data!;
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: rowMemberRecord.color,
                shape: BoxShape.circle,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(rowMemberRecord.memberId!),
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
                  final textUsersRecord = snapshot.data!;
                  return Text(
                    textUsersRecord.displayName,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
