import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/used_com/modal_user/modal_user_widget.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'list_user_n_log_widget.dart' show ListUserNLogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ListUserNLogModel extends FlutterFlowModel<ListUserNLogWidget> {
  ///  Local state fields for this page.

  List<LogRecord> logList = [];
  void addToLogList(LogRecord item) => logList.add(item);
  void removeFromLogList(LogRecord item) => logList.remove(item);
  void removeAtIndexFromLogList(int index) => logList.removeAt(index);
  void insertAtIndexInLogList(int index, LogRecord item) =>
      logList.insert(index, item);
  void updateLogListAtIndex(int index, Function(LogRecord) updateFn) =>
      logList[index] = updateFn(logList[index]);

  List<UsersRecord> userDetail = [];
  void addToUserDetail(UsersRecord item) => userDetail.add(item);
  void removeFromUserDetail(UsersRecord item) => userDetail.remove(item);
  void removeAtIndexFromUserDetail(int index) => userDetail.removeAt(index);
  void insertAtIndexInUserDetail(int index, UsersRecord item) =>
      userDetail.insert(index, item);
  void updateUserDetailAtIndex(int index, Function(UsersRecord) updateFn) =>
      userDetail[index] = updateFn(userDetail[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ListUserNLog widget.
  List<LogRecord>? logDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in ListUserNLog widget.
  List<UsersRecord>? userData;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<LogRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<UsersRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
