import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/used_com/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'bulk_data_widget.dart' show BulkDataWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BulkDataModel extends FlutterFlowModel<BulkDataWidget> {
  ///  Local state fields for this page.

  List<InvestmentDataRecord> listOfUploadData = [];
  void addToListOfUploadData(InvestmentDataRecord item) =>
      listOfUploadData.add(item);
  void removeFromListOfUploadData(InvestmentDataRecord item) =>
      listOfUploadData.remove(item);
  void removeAtIndexFromListOfUploadData(int index) =>
      listOfUploadData.removeAt(index);
  void insertAtIndexInListOfUploadData(int index, InvestmentDataRecord item) =>
      listOfUploadData.insert(index, item);
  void updateListOfUploadDataAtIndex(
          int index, Function(InvestmentDataRecord) updateFn) =>
      listOfUploadData[index] = updateFn(listOfUploadData[index]);

  List<UsersRecord> invesotrName = [];
  void addToInvesotrName(UsersRecord item) => invesotrName.add(item);
  void removeFromInvesotrName(UsersRecord item) => invesotrName.remove(item);
  void removeAtIndexFromInvesotrName(int index) => invesotrName.removeAt(index);
  void insertAtIndexInInvesotrName(int index, UsersRecord item) =>
      invesotrName.insert(index, item);
  void updateInvesotrNameAtIndex(int index, Function(UsersRecord) updateFn) =>
      invesotrName[index] = updateFn(invesotrName[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Bulk_Data widget.
  List<InvestmentDataRecord>? investmentDataOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderTextController;
  String? Function(BuildContext, String?)? searchorderTextControllerValidator;
  // State field(s) for Usernosearch widget.
  final usernosearchController =
      FlutterFlowDataTableController<InvestmentDataRecord>();

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    searchorderFocusNode?.dispose();
    searchorderTextController?.dispose();
  }
}
