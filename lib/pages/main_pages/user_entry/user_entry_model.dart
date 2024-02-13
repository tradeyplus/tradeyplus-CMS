import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/notification/notification_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_entry_widget.dart' show UserEntryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class UserEntryModel extends FlutterFlowModel<UserEntryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for firstname widget.
  FocusNode? firstnameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
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
  // State field(s) for invesmentPeriod widget.
  int? invesmentPeriodValue;
  FormFieldController<int>? invesmentPeriodValueController;
  // State field(s) for yieldPeriod widget.
  int? yieldPeriodValue;
  FormFieldController<int>? yieldPeriodValueController;
  // State field(s) for dob widget.
  FocusNode? dobFocusNode;
  TextEditingController? dobController;
  final dobMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dobControllerValidator;
  DateTime? datePicked;
  // State field(s) for profitRatio widget.
  FocusNode? profitRatioFocusNode;
  TextEditingController? profitRatioController;
  final profitRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? profitRatioControllerValidator;
  // State field(s) for commissionRatio widget.
  FocusNode? commissionRatioFocusNode;
  TextEditingController? commissionRatioController;
  String? Function(BuildContext, String?)? commissionRatioControllerValidator;
  // State field(s) for riskRatio widget.
  FocusNode? riskRatioFocusNode;
  TextEditingController? riskRatioController;
  final riskRatioMask = MaskTextInputFormatter(mask: '0.##');
  String? Function(BuildContext, String?)? riskRatioControllerValidator;
  // State field(s) for phoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoController;
  final phoneNoMask = MaskTextInputFormatter(mask: '+964 (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNoControllerValidator;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteController;
  String? Function(BuildContext, String?)? noteControllerValidator;
  // Model for notification component.
  late NotificationModel notificationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    passwordVisibility = false;
    confirmPasswordVisibility = false;
    notificationModel = createModel(context, () => NotificationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    firstnameFocusNode?.dispose();
    firstnameController?.dispose();

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

    dobFocusNode?.dispose();
    dobController?.dispose();

    profitRatioFocusNode?.dispose();
    profitRatioController?.dispose();

    commissionRatioFocusNode?.dispose();
    commissionRatioController?.dispose();

    riskRatioFocusNode?.dispose();
    riskRatioController?.dispose();

    phoneNoFocusNode?.dispose();
    phoneNoController?.dispose();

    noteFocusNode?.dispose();
    noteController?.dispose();

    notificationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
