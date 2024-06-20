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
  TextEditingController? firstnameEditTextController;
  String? Function(BuildContext, String?)? firstnameEditTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
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
  FocusNode? addressFocusNode1;
  TextEditingController? addressTextController1;
  String? Function(BuildContext, String?)? addressTextController1Validator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode2;
  TextEditingController? addressTextController2;
  String? Function(BuildContext, String?)? addressTextController2Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
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
  TextEditingController? riskRatioTextController;
  final riskRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? riskRatioTextControllerValidator;
  // State field(s) for profitRatio widget.
  FocusNode? profitRatioFocusNode;
  TextEditingController? profitRatioTextController;
  final profitRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? profitRatioTextControllerValidator;
  // State field(s) for commissionRatio widget.
  FocusNode? commissionRatioFocusNode;
  TextEditingController? commissionRatioTextController;
  String? Function(BuildContext, String?)?
      commissionRatioTextControllerValidator;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode1;
  TextEditingController? dobTextController1;
  final dobMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobTextController1Validator;
  DateTime? datePicked1;
  // State field(s) for phoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoTextController;
  final phoneNoMask = MaskTextInputFormatter(mask: '+964 (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNoTextControllerValidator;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  // State field(s) for firstnameCreate widget.
  FocusNode? firstnameCreateFocusNode;
  TextEditingController? firstnameCreateTextController;
  String? Function(BuildContext, String?)?
      firstnameCreateTextControllerValidator;
  // State field(s) for lastnamecreated widget.
  FocusNode? lastnamecreatedFocusNode;
  TextEditingController? lastnamecreatedTextController;
  String? Function(BuildContext, String?)?
      lastnamecreatedTextControllerValidator;
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
  TextEditingController? addressCreatedTextController;
  String? Function(BuildContext, String?)?
      addressCreatedTextControllerValidator;
  // State field(s) for emailCreated widget.
  FocusNode? emailCreatedFocusNode;
  TextEditingController? emailCreatedTextController;
  String? Function(BuildContext, String?)? emailCreatedTextControllerValidator;
  String? _emailCreatedTextControllerValidator(
      BuildContext context, String? val) {
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
  TextEditingController? passwordCreatedTextController;
  late bool passwordCreatedVisibility;
  String? Function(BuildContext, String?)?
      passwordCreatedTextControllerValidator;
  String? _passwordCreatedTextControllerValidator(
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
  TextEditingController? confirmPasswordcreatedTextController;
  late bool confirmPasswordcreatedVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordcreatedTextControllerValidator;
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
  TextEditingController? riskRatioCreatedTextController;
  final riskRatioCreatedMask = MaskTextInputFormatter(mask: '0.#0');
  String? Function(BuildContext, String?)?
      riskRatioCreatedTextControllerValidator;
  // State field(s) for profitRatioCreated widget.
  FocusNode? profitRatioCreatedFocusNode;
  TextEditingController? profitRatioCreatedTextController;
  final profitRatioCreatedMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)?
      profitRatioCreatedTextControllerValidator;
  // State field(s) for commissionRatioCreated widget.
  FocusNode? commissionRatioCreatedFocusNode;
  TextEditingController? commissionRatioCreatedTextController;
  String? Function(BuildContext, String?)?
      commissionRatioCreatedTextControllerValidator;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode2;
  TextEditingController? dobTextController2;
  final dobMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobTextController2Validator;
  DateTime? datePicked2;
  // State field(s) for phoneNoCreated widget.
  FocusNode? phoneNoCreatedFocusNode;
  TextEditingController? phoneNoCreatedTextController;
  final phoneNoCreatedMask =
      MaskTextInputFormatter(mask: '+964 (###) ###-##-##');
  String? Function(BuildContext, String?)?
      phoneNoCreatedTextControllerValidator;
  // State field(s) for noteCreated widget.
  FocusNode? noteCreatedFocusNode;
  TextEditingController? noteCreatedTextController;
  String? Function(BuildContext, String?)? noteCreatedTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? out;
  // Model for logPage component.
  late LogPageModel logPageModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    emailCreatedTextControllerValidator = _emailCreatedTextControllerValidator;
    passwordCreatedVisibility = false;
    passwordCreatedTextControllerValidator =
        _passwordCreatedTextControllerValidator;
    confirmPasswordcreatedVisibility = false;
    logPageModel = createModel(context, () => LogPageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    firstnameEditFocusNode?.dispose();
    firstnameEditTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    addressFocusNode1?.dispose();
    addressTextController1?.dispose();

    addressFocusNode2?.dispose();
    addressTextController2?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    riskRatioFocusNode?.dispose();
    riskRatioTextController?.dispose();

    profitRatioFocusNode?.dispose();
    profitRatioTextController?.dispose();

    commissionRatioFocusNode?.dispose();
    commissionRatioTextController?.dispose();

    dobFocusNode1?.dispose();
    dobTextController1?.dispose();

    phoneNoFocusNode?.dispose();
    phoneNoTextController?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();

    firstnameCreateFocusNode?.dispose();
    firstnameCreateTextController?.dispose();

    lastnamecreatedFocusNode?.dispose();
    lastnamecreatedTextController?.dispose();

    addressCreatedFocusNode?.dispose();
    addressCreatedTextController?.dispose();

    emailCreatedFocusNode?.dispose();
    emailCreatedTextController?.dispose();

    passwordCreatedFocusNode?.dispose();
    passwordCreatedTextController?.dispose();

    confirmPasswordcreatedFocusNode?.dispose();
    confirmPasswordcreatedTextController?.dispose();

    riskRatioCreatedFocusNode?.dispose();
    riskRatioCreatedTextController?.dispose();

    profitRatioCreatedFocusNode?.dispose();
    profitRatioCreatedTextController?.dispose();

    commissionRatioCreatedFocusNode?.dispose();
    commissionRatioCreatedTextController?.dispose();

    dobFocusNode2?.dispose();
    dobTextController2?.dispose();

    phoneNoCreatedFocusNode?.dispose();
    phoneNoCreatedTextController?.dispose();

    noteCreatedFocusNode?.dispose();
    noteCreatedTextController?.dispose();

    logPageModel.dispose();
  }
}
