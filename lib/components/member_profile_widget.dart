import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_profile_model.dart';
export 'member_profile_model.dart';

class MemberProfileWidget extends StatefulWidget {
  const MemberProfileWidget({Key? key}) : super(key: key);

  @override
  _MemberProfileWidgetState createState() => _MemberProfileWidgetState();
}

class _MemberProfileWidgetState extends State<MemberProfileWidget> {
  late MemberProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberProfileModel());
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
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(
            'https://images.unsplash.com/photo-1521676129211-b7a9e7592e65?w=&h=undefined',
          ).image,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 5.0,
          ),
        ),
      ),
    );
  }
}
