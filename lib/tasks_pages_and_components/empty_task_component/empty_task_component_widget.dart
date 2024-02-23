import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_task_component_model.dart';
export 'empty_task_component_model.dart';

class EmptyTaskComponentWidget extends StatefulWidget {
  const EmptyTaskComponentWidget({
    super.key,
    required this.isShooping,
  });

  final bool? isShooping;

  @override
  State<EmptyTaskComponentWidget> createState() =>
      _EmptyTaskComponentWidgetState();
}

class _EmptyTaskComponentWidgetState extends State<EmptyTaskComponentWidget> {
  late EmptyTaskComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyTaskComponentModel());
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
      child: Container(
        width: 160.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Icon(
                  Icons.content_paste,
                  color: Color(0xFF8086CE),
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: Text(
                  'Seems that you don\'t have any ${widget.isShooping! ? 'items.' : 'tasks.'}',
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'r1x4j5x5' /* Add a new task to get started */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Source Sans Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
