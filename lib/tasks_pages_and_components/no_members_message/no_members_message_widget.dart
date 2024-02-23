import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_members_message_model.dart';
export 'no_members_message_model.dart';

class NoMembersMessageWidget extends StatefulWidget {
  const NoMembersMessageWidget({super.key});

  @override
  State<NoMembersMessageWidget> createState() => _NoMembersMessageWidgetState();
}

class _NoMembersMessageWidgetState extends State<NoMembersMessageWidget> {
  late NoMembersMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoMembersMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      FFLocalizations.of(context).getText(
        'ectvpj4y' /* There are no members assigned. */,
      ),
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).labelMedium,
    );
  }
}
