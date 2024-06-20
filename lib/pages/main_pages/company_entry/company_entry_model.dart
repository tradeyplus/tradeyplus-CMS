import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/used_com/log_page/log_page_widget.dart';
import '/components/used_com/sample_file_download/sample_file_download_widget.dart';
import '/components/used_com/upload_page/upload_page_widget.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CompanyEntryModel extends FlutterFlowModel<CompanyEntryWidget> {
  ///  Local state fields for this page.

  bool selectedbulk = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for evaluation widget.
  FocusNode? evaluationFocusNode;
  TextEditingController? evaluationTextController;
  String? Function(BuildContext, String?)? evaluationTextControllerValidator;
  // State field(s) for Balance widget.
  FocusNode? balanceFocusNode;
  TextEditingController? balanceTextController;
  String? Function(BuildContext, String?)? balanceTextControllerValidator;
  // State field(s) for points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsTextController;
  String? Function(BuildContext, String?)? pointsTextControllerValidator;
  // State field(s) for investorDropdown widget.
  String? investorDropdownValue;
  FormFieldController<String>? investorDropdownValueController;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for Date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  final dateMask = MaskTextInputFormatter(mask: '##%');
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for profitRatio widget.
  FocusNode? profitRatioFocusNode;
  TextEditingController? profitRatioTextController;
  final profitRatioMask = MaskTextInputFormatter(mask: '##%');
  String? Function(BuildContext, String?)? profitRatioTextControllerValidator;
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
  // Model for logPage component.
  late LogPageModel logPageModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    uploadPageModel = createModel(context, () => UploadPageModel());
    logPageModel = createModel(context, () => LogPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    evaluationFocusNode?.dispose();
    evaluationTextController?.dispose();

    balanceFocusNode?.dispose();
    balanceTextController?.dispose();

    pointsFocusNode?.dispose();
    pointsTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    profitRatioFocusNode?.dispose();
    profitRatioTextController?.dispose();

    uploadPageModel.dispose();
    logPageModel.dispose();
  }
}
