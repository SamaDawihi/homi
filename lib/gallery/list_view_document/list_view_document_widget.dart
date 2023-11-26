import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/gallery/list_view_attached_file/list_view_attached_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'list_view_document_model.dart';
export 'list_view_document_model.dart';

class ListViewDocumentWidget extends StatefulWidget {
  const ListViewDocumentWidget({
    Key? key,
    required this.galleryDocument,
  }) : super(key: key);

  final DocumentRecord? galleryDocument;

  @override
  _ListViewDocumentWidgetState createState() => _ListViewDocumentWidgetState();
}

class _ListViewDocumentWidgetState extends State<ListViewDocumentWidget>
    with TickerProviderStateMixin {
  late ListViewDocumentModel _model;

  var hasIconTriggered = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 0.5,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewDocumentModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 412.0,
      height: 350.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      valueOrDefault<String>(
                        widget.galleryDocument?.title,
                        'Title',
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Open Sans',
                            fontSize: 26.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Icon(
                          Icons.edit_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                      Icon(
                        Icons.delete_forever,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 5.0,
            thickness: 5.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          if (widget.galleryDocument?.document != null &&
              widget.galleryDocument?.document != '')
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: Image.network(
                        widget.galleryDocument!.document,
                        fit: BoxFit.contain,
                      ),
                      allowRotation: false,
                      tag: widget.galleryDocument!.document,
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: widget.galleryDocument!.document,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Image.network(
                    widget.galleryDocument!.document,
                    width: 350.0,
                    height: 190.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          if (widget.galleryDocument?.document != null &&
              widget.galleryDocument?.document != '')
            Divider(
              height: 5.0,
              thickness: 5.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '3ly8geug' /* Attached Files */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.viewMore) {
                      if (animationsMap['iconOnActionTriggerAnimation'] !=
                          null) {
                        animationsMap['iconOnActionTriggerAnimation']!
                            .controller
                            .reverse();
                      }
                    } else {
                      if (animationsMap['iconOnActionTriggerAnimation'] !=
                          null) {
                        setState(() => hasIconTriggered = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async =>
                                animationsMap['iconOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0));
                      }
                    }

                    setState(() {
                      _model.viewMore = !_model.viewMore;
                    });
                  },
                  child: Icon(
                    Icons.expand_more_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 28.0,
                  ),
                ).animateOnActionTrigger(
                    animationsMap['iconOnActionTriggerAnimation']!,
                    hasBeenTriggered: hasIconTriggered),
              ),
            ],
          ),
          if (_model.viewMore)
            Expanded(
              child: Builder(
                builder: (context) {
                  final atachedFiles =
                      widget.galleryDocument?.attachedFiles?.toList() ?? [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: atachedFiles.length,
                    itemBuilder: (context, atachedFilesIndex) {
                      final atachedFilesItem = atachedFiles[atachedFilesIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.listViewAttachedFileModels.getModel(
                            atachedFilesIndex.toString(),
                            atachedFilesIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: ListViewAttachedFileWidget(
                            key: Key(
                              'Keycam_${atachedFilesIndex.toString()}',
                            ),
                            url: atachedFilesItem,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
