import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/sample_file_download/sample_file_download_widget.dart';
import '/components/upload_page/upload_page_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'company_entry_widget.dart' show CompanyEntryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CompanyEntryModel extends FlutterFlowModel<CompanyEntryWidget> {
  ///  Local state fields for this page.

  bool selectedbulk = true;

  Color? selectedfilledbulk = Color(4281355695);

  Color? selectedtextbulk = Color(4294967295);

  Color? selectedtextmonthly = Color(4279571998);

  Color? selectedfilledmonthly = Color(4294967295);

  Color? selectedshadowbulk;

  Color? selectedshadowmonth;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for evaluation widget.
  FocusNode? evaluationFocusNode;
  TextEditingController? evaluationController;
  String? Function(BuildContext, String?)? evaluationControllerValidator;
  // State field(s) for points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsController;
  String? Function(BuildContext, String?)? pointsControllerValidator;
  // State field(s) for investorDropdown widget.
  String? investorDropdownValue;
  FormFieldController<String>? investorDropdownValueController;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateController;
  final dateMask = MaskTextInputFormatter(mask: '##%');
  String? Function(BuildContext, String?)? dateControllerValidator;
  DateTime? datePicked;
  // State field(s) for profitRatio widget.
  FocusNode? profitRatioFocusNode;
  TextEditingController? profitRatioController;
  final profitRatioMask = MaskTextInputFormatter(mask: '##%');
  String? Function(BuildContext, String?)? profitRatioControllerValidator;
  // State field(s) for Transction_Type widget.
  String? transctionTypeValue;
  FormFieldController<String>? transctionTypeValueController;
  // State field(s) for durationOptions widget.
  int? durationOptionsValue;
  FormFieldController<int>? durationOptionsValueController;
  // Model for upload_page component.
  late UploadPageModel uploadPageModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? investorDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InvestmentDataRecord? createdInvesmntdata;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    uploadPageModel = createModel(context, () => UploadPageModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    evaluationFocusNode?.dispose();
    evaluationController?.dispose();

    pointsFocusNode?.dispose();
    pointsController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();

    dateFocusNode?.dispose();
    dateController?.dispose();

    profitRatioFocusNode?.dispose();
    profitRatioController?.dispose();

    uploadPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
