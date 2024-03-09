import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_assained_to_member_model.dart';
export 'component_assained_to_member_model.dart';

class ComponentAssainedToMemberWidget extends StatefulWidget {
  const ComponentAssainedToMemberWidget({
    super.key,
    required this.memberRef,
    bool? right,
  }) : this.right = right ?? true;

  final DocumentReference? memberRef;
  final bool right;

  @override
  State<ComponentAssainedToMemberWidget> createState() =>
      _ComponentAssainedToMemberWidgetState();
}

class _ComponentAssainedToMemberWidgetState
    extends State<ComponentAssainedToMemberWidget> {
  late ComponentAssainedToMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentAssainedToMemberModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: StreamBuilder<MemberRecord>(
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
