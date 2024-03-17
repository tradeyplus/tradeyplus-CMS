import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/components/used_com/log_page/log_page_widget.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'user_entry_widget.dart' show UserEntryWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class UserEntryModel extends FlutterFlowModel<UserEntryWidget> {
  ///  Local state fields for this page.

  DocumentReference? userRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for firstnameEdit widget.
  FocusNode? firstnameEditFocusNode;
  TextEditingController? firstnameEditController;
  String? Function(BuildContext, String?)? firstnameEditControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for portfolioType widget.
  String? portfolioTypeValue;
  FormFieldController<String>? portfolioTypeValueController;
  // State field(s) for nationality widget.
  String? nationalityValue;
  FormFieldController<String>? nationalityValueController;
  // State field(s) for package widget.
  String? packageValue;
  FormFieldController<String>? packageValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for paymentStatus widget.
  String? paymentStatusValue;
  FormFieldController<String>? paymentStatusValueController;
  // State field(s) for investmentPeriod widget.
  int? investmentPeriodValue;
  FormFieldController<int>? investmentPeriodValueController;
  // State field(s) for yieldPeriod widget.
  int? yieldPeriodValue;
  FormFieldController<int>? yieldPeriodValueController;
  // State field(s) for riskRatio widget.
  FocusNode? riskRatioFocusNode;
  TextEditingController? riskRatioController;
  final riskRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? riskRatioControllerValidator;
  // State field(s) for profitRatio widget.
  FocusNode? profitRatioFocusNode;
  TextEditingController? profitRatioController;
  final profitRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? profitRatioControllerValidator;
  // State field(s) for commissionRatio widget.
  FocusNode? commissionRatioFocusNode;
  TextEditingController? commissionRatioController;
  String? Function(BuildContext, String?)? commissionRatioControllerValidator;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode1;
  TextEditingController? dobController1;
  final dobMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobController1Validator;
  DateTime? datePicked1;
  // State field(s) for phoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoController;
  final phoneNoMask = MaskTextInputFormatter(mask: '+964 (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNoControllerValidator;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteController;
  String? Function(BuildContext, String?)? noteControllerValidator;
  // State field(s) for firstnameCreate widget.
  FocusNode? firstnameCreateFocusNode;
  TextEditingController? firstnameCreateController;
  String? Function(BuildContext, String?)? firstnameCreateControllerValidator;
  // State field(s) for lastnamecreated widget.
  FocusNode? lastnamecreatedFocusNode;
  TextEditingController? lastnamecreatedController;
  String? Function(BuildContext, String?)? lastnamecreatedControllerValidator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for portfolioTypeCreated widget.
  String? portfolioTypeCreatedValue;
  FormFieldController<String>? portfolioTypeCreatedValueController;
  // State field(s) for nationalityCreated widget.
  String? nationalityCreatedValue;
  FormFieldController<String>? nationalityCreatedValueController;
  // State field(s) for packageCreated widget.
  String? packageCreatedValue;
  FormFieldController<String>? packageCreatedValueController;
  // State field(s) for addressCreated widget.
  FocusNode? addressCreatedFocusNode;
  TextEditingController? addressCreatedController;
  String? Function(BuildContext, String?)? addressCreatedControllerValidator;
  // State field(s) for emailCreated widget.
  FocusNode? emailCreatedFocusNode;
  TextEditingController? emailCreatedController;
  String? Function(BuildContext, String?)? emailCreatedControllerValidator;
  String? _emailCreatedControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nvdhrygz' /* Field is required */,
      );
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'y2hb3z9k' /* has to be valid Email */,
      );
    }
    return null;
  }

  // State field(s) for passwordCreated widget.
  FocusNode? passwordCreatedFocusNode;
  TextEditingController? passwordCreatedController;
  late bool passwordCreatedVisibility;
  String? Function(BuildContext, String?)? passwordCreatedControllerValidator;
  String? _passwordCreatedControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vigozjl4' /* Field is required */,
      );
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for confirmPasswordcreated widget.
  FocusNode? confirmPasswordcreatedFocusNode;
  TextEditingController? confirmPasswordcreatedController;
  late bool confirmPasswordcreatedVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordcreatedControllerValidator;
  // State field(s) for roleCreated widget.
  String? roleCreatedValue;
  FormFieldController<String>? roleCreatedValueController;
  // State field(s) for paymentStatusCreated widget.
  String? paymentStatusCreatedValue;
  FormFieldController<String>? paymentStatusCreatedValueController;
  // State field(s) for investmentPeriodCreated widget.
  int? investmentPeriodCreatedValue;
  FormFieldController<int>? investmentPeriodCreatedValueController;
  // State field(s) for yieldPeriodCreated widget.
  int? yieldPeriodCreatedValue;
  FormFieldController<int>? yieldPeriodCreatedValueController;
  // State field(s) for riskRatioCreated widget.
  FocusNode? riskRatioCreatedFocusNode;
  TextEditingController? riskRatioCreatedController;
  final riskRatioCreatedMask = MaskTextInputFormatter(mask: '0.#0');
  String? Function(BuildContext, String?)? riskRatioCreatedControllerValidator;
  // State field(s) for profitRatioCreated widget.
  FocusNode? profitRatioCreatedFocusNode;
  TextEditingController? profitRatioCreatedController;
  final profitRatioCreatedMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)?
      profitRatioCreatedControllerValidator;
  // State field(s) for commissionRatioCreated widget.
  FocusNode? commissionRatioCreatedFocusNode;
  TextEditingController? commissionRatioCreatedController;
  String? Function(BuildContext, String?)?
      commissionRatioCreatedControllerValidator;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode2;
  TextEditingController? dobController2;
  final dobMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobController2Validator;
  DateTime? datePicked2;
  // State field(s) for phoneNoCreated widget.
  FocusNode? phoneNoCreatedFocusNode;
  TextEditingController? phoneNoCreatedController;
  final phoneNoCreatedMask =
      MaskTextInputFormatter(mask: '+964 (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNoCreatedControllerValidator;
  // State field(s) for noteCreated widget.
  FocusNode? noteCreatedFocusNode;
  TextEditingController? noteCreatedController;
  String? Function(BuildContext, String?)? noteCreatedControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? out;
  // Model for logPage component.
  late LogPageModel logPageModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    emailCreatedControllerValidator = _emailCreatedControllerValidator;
    passwordCreatedVisibility = false;
    passwordCreatedControllerValidator = _passwordCreatedControllerValidator;
    confirmPasswordcreatedVisibility = false;
    logPageModel = createModel(context, () => LogPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    firstnameEditFocusNode?.dispose();
    firstnameEditController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    riskRatioFocusNode?.dispose();
    riskRatioController?.dispose();

    profitRatioFocusNode?.dispose();
    profitRatioController?.dispose();

    commissionRatioFocusNode?.dispose();
    commissionRatioController?.dispose();

    dobFocusNode1?.dispose();
    dobController1?.dispose();

    phoneNoFocusNode?.dispose();
    phoneNoController?.dispose();

    noteFocusNode?.dispose();
    noteController?.dispose();

    firstnameCreateFocusNode?.dispose();
    firstnameCreateController?.dispose();

    lastnamecreatedFocusNode?.dispose();
    lastnamecreatedController?.dispose();

    addressCreatedFocusNode?.dispose();
    addressCreatedController?.dispose();

    emailCreatedFocusNode?.dispose();
    emailCreatedController?.dispose();

    passwordCreatedFocusNode?.dispose();
    passwordCreatedController?.dispose();

    confirmPasswordcreatedFocusNode?.dispose();
    confirmPasswordcreatedController?.dispose();

    riskRatioCreatedFocusNode?.dispose();
    riskRatioCreatedController?.dispose();

    profitRatioCreatedFocusNode?.dispose();
    profitRatioCreatedController?.dispose();

    commissionRatioCreatedFocusNode?.dispose();
    commissionRatioCreatedController?.dispose();

    dobFocusNode2?.dispose();
    dobController2?.dispose();

    phoneNoCreatedFocusNode?.dispose();
    phoneNoCreatedController?.dispose();

    noteCreatedFocusNode?.dispose();
    noteCreatedController?.dispose();

    logPageModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
