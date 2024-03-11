import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/used_com/profile/profile_widget.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'main_customer_list_widget.dart' show MainCustomerListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class MainCustomerListModel extends FlutterFlowModel<MainCustomerListWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> listOfUserDocs = [];
  void addToListOfUserDocs(UsersRecord item) => listOfUserDocs.add(item);
  void removeFromListOfUserDocs(UsersRecord item) =>
      listOfUserDocs.remove(item);
  void removeAtIndexFromListOfUserDocs(int index) =>
      listOfUserDocs.removeAt(index);
  void insertAtIndexInListOfUserDocs(int index, UsersRecord item) =>
      listOfUserDocs.insert(index, item);
  void updateListOfUserDocsAtIndex(int index, Function(UsersRecord) updateFn) =>
      listOfUserDocs[index] = updateFn(listOfUserDocs[index]);

  bool isloaded = true;

  bool sortAscending = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Main_customerList widget.
  List<UsersRecord>? userQueryList;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // Model for profile component.
  late ProfileModel profileModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderController;
  String? Function(BuildContext, String?)? searchorderControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for Usernosearch widget.
  final usernosearchController1 = FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for Usernosearch widget.
  final usernosearchController2 = FlutterFlowDataTableController<UsersRecord>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    profileModel = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    profileModel.dispose();
    searchorderFocusNode?.dispose();
    searchorderController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
