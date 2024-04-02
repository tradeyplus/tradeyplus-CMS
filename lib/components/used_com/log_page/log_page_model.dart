import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'log_page_widget.dart' show LogPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogPageModel extends FlutterFlowModel<LogPageWidget> {
  ///  Local state fields for this component.

  List<LogRecord> filterLog = [];
  void addToFilterLog(LogRecord item) => filterLog.add(item);
  void removeFromFilterLog(LogRecord item) => filterLog.remove(item);
  void removeAtIndexFromFilterLog(int index) => filterLog.removeAt(index);
  void insertAtIndexInFilterLog(int index, LogRecord item) =>
      filterLog.insert(index, item);
  void updateFilterLogAtIndex(int index, Function(LogRecord) updateFn) =>
      filterLog[index] = updateFn(filterLog[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in logPage widget.
  List<LogRecord>? investmentData;
  // Stores action output result for [Firestore Query - Query a collection] action in logPage widget.
  List<LogRecord>? userEntry;
  // Stores action output result for [Firestore Query - Query a collection] action in logPage widget.
  List<LogRecord>? allLog;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
