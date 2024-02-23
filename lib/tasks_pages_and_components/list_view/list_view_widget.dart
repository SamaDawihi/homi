import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/extra/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/extra/list_loading/list_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/tasks_pages_and_components/component_responsible_to_member/component_responsible_to_member_widget.dart';
import '/tasks_pages_and_components/confirm_delete_list/confirm_delete_list_widget.dart';
import '/tasks_pages_and_components/empty_task_component/empty_task_component_widget.dart';
import '/tasks_pages_and_components/input_component_add_task/input_component_add_task_widget.dart';
import '/tasks_pages_and_components/list_view_item/list_view_item_widget.dart';
import '/tasks_pages_and_components/no_members_message/no_members_message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_model.dart';
export 'list_view_model.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
    required this.listRef,
    required this.isShopping,
  });

  final DocumentReference? listRef;
  final bool? isShopping;

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget>
    with TickerProviderStateMixin {
  late ListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
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
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.forGettingAssignedMembers =
          await ListRecord.getDocumentOnce(widget.listRef!);
      setState(() {
        _model.selectedMembers = _model.forGettingAssignedMembers!.assignedTo
            .toList()
            .cast<DocumentReference>();
      });
      _model.numberOfItems = await queryItemRecordCount(
        queryBuilder: (itemRecord) => itemRecord.where(
          'belongTo',
          isEqualTo: widget.listRef,
        ),
      );
      setState(() {
        _model.numberOfItms = _model.numberOfItems!;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: Color(0xFF57636C),
                                size: 25.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('AllLists');
                              },
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.isShopping!
                                  ? 'Shopping List'
                                  : 'To-Do List',
                              'Shooping List',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/mainLogo.png',
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: StreamBuilder<ListRecord>(
                          stream: ListRecord.getDocument(widget.listRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: ListLoadingWidget(),
                              );
                            }
                            final columnListRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          columnListRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 30.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 7.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                InputComponentAddTaskWidget(
                                                              belongToRef:
                                                                  widget
                                                                      .listRef!,
                                                              isShooping: widget
                                                                  .isShopping!,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 28.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 7.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'EditList',
                                                    queryParameters: {
                                                      'isShopping':
                                                          serializeParam(
                                                        columnListRecord
                                                            .isShoopingList,
                                                        ParamType.bool,
                                                      ),
                                                      'listDoc': serializeParam(
                                                        columnListRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'listDoc':
                                                          columnListRecord,
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.mode_edit_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 7.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                ConfirmDeleteListWidget(
                                                              belongTo: widget
                                                                  .listRef,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Icon(
                                                    Icons.delete_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 28.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.viewMore) {
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'iconOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                } else {
                                                  if (animationsMap[
                                                          'iconOnActionTriggerAnimation'] !=
                                                      null) {
                                                    setState(() =>
                                                        hasIconTriggered =
                                                            true);
                                                    SchedulerBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) async =>
                                                                animationsMap[
                                                                        'iconOnActionTriggerAnimation']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                  }
                                                }

                                                setState(() {
                                                  _model.viewMore =
                                                      !_model.viewMore;
                                                });
                                              },
                                              child: Icon(
                                                Icons.expand_more_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 28.0,
                                              ),
                                            ).animateOnActionTrigger(
                                                animationsMap[
                                                    'iconOnActionTriggerAnimation']!,
                                                hasBeenTriggered:
                                                    hasIconTriggered),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (_model.viewMore)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'wv8w2fhb' /* Description :  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      if (columnListRecord.description !=
                                              null &&
                                          columnListRecord.description != '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 10.0),
                                          child: Text(
                                            columnListRecord.description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                        ),
                                      if (columnListRecord.description ==
                                              null ||
                                          columnListRecord.description == '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1oo63y60' /* No description. */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '38s7atkv' /* Responsible Members : */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child:
                                            StreamBuilder<List<MemberRecord>>(
                                          stream: queryMemberRecord(
                                            queryBuilder: (memberRecord) =>
                                                memberRecord.where(
                                              'familyId',
                                              isEqualTo: FFAppState().familyId,
                                            ),
                                          ),
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
                                            List<MemberRecord>
                                                listViewMemberRecordList =
                                                snapshot.data!;
                                            if (listViewMemberRecordList
                                                .isEmpty) {
                                              return Center(
                                                child: NoMembersMessageWidget(),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMemberRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMemberRecord =
                                                    listViewMemberRecordList[
                                                        listViewIndex];
                                                return Visibility(
                                                  visible: columnListRecord
                                                      .assignedTo
                                                      .contains(
                                                          listViewMemberRecord
                                                              .reference),
                                                  child: Container(
                                                    height: 20.0,
                                                    decoration: BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .componentResponsibleToMemberModels
                                                          .getModel(
                                                        listViewIndex
                                                            .toString(),
                                                        listViewIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          ComponentResponsibleToMemberWidget(
                                                        key: Key(
                                                          'Keynk8_${listViewIndex.toString()}',
                                                        ),
                                                        memberRef:
                                                            listViewMemberRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      if (columnListRecord.assignedTo.length ==
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '10ujipip' /* There are no members assigned. */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<List<ItemRecord>>(
                                        stream: queryItemRecord(
                                          queryBuilder: (itemRecord) =>
                                              itemRecord.where(
                                            'belongTo',
                                            isEqualTo:
                                                columnListRecord.reference,
                                          ),
                                        )..listen((snapshot) async {
                                            List<ItemRecord>
                                                listViewItemRecordList =
                                                snapshot;
                                            if (_model.listViewPreviousSnapshot !=
                                                    null &&
                                                !const ListEquality(
                                                        ItemRecordDocumentEquality())
                                                    .equals(
                                                        listViewItemRecordList,
                                                        _model
                                                            .listViewPreviousSnapshot)) {
                                              setState(() {
                                                _model.numberOfItms =
                                                    listViewItemRecordList
                                                        .length;
                                              });

                                              setState(() {});
                                            }
                                            _model.listViewPreviousSnapshot =
                                                snapshot;
                                          }),
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
                                          List<ItemRecord>
                                              listViewItemRecordList =
                                              snapshot.data!;
                                          if (listViewItemRecordList.isEmpty) {
                                            return Container(
                                              width: 500.0,
                                              height: 200.0,
                                              child: EmptyTaskComponentWidget(
                                                isShooping: widget.isShopping!,
                                              ),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewItemRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewItemRecord =
                                                  listViewItemRecordList[
                                                      listViewIndex];
                                              return wrapWithModel(
                                                model: _model.listViewItemModels
                                                    .getModel(
                                                  listViewIndex.toString(),
                                                  listViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: ListViewItemWidget(
                                                  key: Key(
                                                    'Key8p0_${listViewIndex.toString()}',
                                                  ),
                                                  itemRef: listViewItemRecord
                                                      .reference,
                                                  isShooping:
                                                      widget.isShopping!,
                                                  done: listViewItemRecord.done,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: BottomNavBarWidget(
                    currentPage: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
