import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/tasks_pages_and_components/component_assained_to_member/component_assained_to_member_widget.dart';
import '/tasks_pages_and_components/no_members_message/no_members_message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_component_view_list_model.dart';
export 'list_component_view_list_model.dart';

class ListComponentViewListWidget extends StatefulWidget {
  const ListComponentViewListWidget({
    Key? key,
    required this.listRef,
  }) : super(key: key);

  final DocumentReference? listRef;

  @override
  _ListComponentViewListWidgetState createState() =>
      _ListComponentViewListWidgetState();
}

class _ListComponentViewListWidgetState
    extends State<ListComponentViewListWidget> {
  late ListComponentViewListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListComponentViewListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.list = await ListRecord.getDocumentOnce(widget.listRef!);
      _model.member =
          await MemberRecord.getDocumentOnce(_model.list!.createdBy!);
      if (_model.member?.color != null) {
        setState(() {
          _model.color = _model.member!.color!;
        });
        return;
      } else {
        return;
      }
    });
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
      padding: EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
      child: StreamBuilder<ListRecord>(
        stream: ListRecord.getDocument(widget.listRef!),
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
          final contentView2ListRecord = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'ListView',
                queryParameters: {
                  'listRef': serializeParam(
                    widget.listRef,
                    ParamType.DocumentReference,
                  ),
                  'isShopping': serializeParam(
                    contentView2ListRecord.isShoopingList,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: valueOrDefault<double>(
                contentView2ListRecord.assignedTo.length < 5
                    ? 90.0
                    : valueOrDefault<double>(
                        90.00 + (5 * contentView2ListRecord.assignedTo.length),
                        90.0,
                      ),
                90.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: Color(0xFFE0E3E7),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (contentView2ListRecord.isShoopingList) {
                          return Icon(
                            Icons.shopping_cart_outlined,
                            color: _model.color,
                            size: 24.0,
                          );
                        } else {
                          return Icon(
                            Icons.checklist_sharp,
                            color: _model.color,
                            size: 24.0,
                          );
                        }
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          contentView2ListRecord.name,
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 10.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MemberRecord> listViewMemberRecordList =
                                      snapshot.data!;
                                  if (listViewMemberRecordList.isEmpty) {
                                    return NoMembersMessageWidget();
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewMemberRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewMemberRecord =
                                          listViewMemberRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: contentView2ListRecord
                                            .assignedTo
                                            .contains(
                                                listViewMemberRecord.reference),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: wrapWithModel(
                                            model: _model
                                                .componentAssainedToMemberModels
                                                .getModel(
                                              listViewIndex.toString(),
                                              listViewIndex,
                                            ),
                                            updateCallback: () =>
                                                setState(() {}),
                                            child:
                                                ComponentAssainedToMemberWidget(
                                              key: Key(
                                                'Keyacq_${listViewIndex.toString()}',
                                              ),
                                              memberRef: listViewMemberRecord
                                                  .reference,
                                              right: false,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
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
