import '/components/sample_file_download/sample_file_download_widget.dart';
import '/components/upload_page/upload_page_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bulk_data_widget.dart' show BulkDataWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BulkDataModel extends FlutterFlowModel<BulkDataWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for upload_page component.
  late UploadPageModel uploadPageModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    uploadPageModel = createModel(context, () => UploadPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    uploadPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
