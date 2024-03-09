import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_attached_file_model.dart';
export 'list_view_attached_file_model.dart';

class ListViewAttachedFileWidget extends StatefulWidget {
  const ListViewAttachedFileWidget({
    super.key,
    required this.attachment,
  });

  final AttachmentRecord? attachment;

  @override
  State<ListViewAttachedFileWidget> createState() =>
      _ListViewAttachedFileWidgetState();
}

class _ListViewAttachedFileWidgetState
    extends State<ListViewAttachedFileWidget> {
  late ListViewAttachedFileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewAttachedFileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            valueOrDefault<String>(
              widget.attachment?.name,
              'File Name',
            ).maybeHandleOverflow(
              maxChars: 15,
              replacement: '…',
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Open Sans',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
            minFontSize: 9.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await launchURL(widget.attachment!.url);
              },
              child: Icon(
                Icons.download_sharp,
                color: FlutterFlowTheme.of(context).primary,
                size: 22.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
