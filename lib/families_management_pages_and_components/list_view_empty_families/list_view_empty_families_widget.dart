import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_empty_families_model.dart';
export 'list_view_empty_families_model.dart';

class ListViewEmptyFamiliesWidget extends StatefulWidget {
  const ListViewEmptyFamiliesWidget({super.key});

  @override
  State<ListViewEmptyFamiliesWidget> createState() =>
      _ListViewEmptyFamiliesWidgetState();
}

class _ListViewEmptyFamiliesWidgetState
    extends State<ListViewEmptyFamiliesWidget> {
  late ListViewEmptyFamiliesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewEmptyFamiliesModel());
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
                child: FaIcon(
                  FontAwesomeIcons.houseDamage,
                  color: Color(0xFF8086CE),
                  size: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'kkxfr7vw' /* Seems that you don't have any ... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'unepzpw3' /* Create a new family or join an... */,
                ),
                textAlign: TextAlign.center,
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
