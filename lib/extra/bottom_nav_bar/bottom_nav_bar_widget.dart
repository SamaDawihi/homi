import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_bar_model.dart';
export 'bottom_nav_bar_model.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int? currentPage;

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late BottomNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavBarModel());
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
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 1.00),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.groups_2,
                    color: widget.currentPage == 0
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x8A000000),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed('FamilyProfile');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.calendar_month,
                    color: widget.currentPage == 1
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x8A000000),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed('Calendar');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: Icon(
                    Icons.checklist_sharp,
                    color: widget.currentPage == 2
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x8A000000),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed('AllLists');
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 50.0,
                  icon: FaIcon(
                    FontAwesomeIcons.bullhorn,
                    color: widget.currentPage == 3
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x8A000000),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed('Announcements');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
