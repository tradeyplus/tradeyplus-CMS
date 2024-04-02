import '/components/used_com/log_page/log_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for logPage component.
  late LogPageModel logPageModel;

  @override
  void initState(BuildContext context) {
    logPageModel = createModel(context, () => LogPageModel());
  }

  @override
  void dispose() {
    logPageModel.dispose();
  }
}
