import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogRecord extends FirestoreRecord {
  LogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "log_user_ref" field.
  DocumentReference? _logUserRef;
  DocumentReference? get logUserRef => _logUserRef;
  bool hasLogUserRef() => _logUserRef != null;

  // "log_type" field.
  LogType? _logType;
  LogType? get logType => _logType;
  bool hasLogType() => _logType != null;

  // "log_time" field.
  DateTime? _logTime;
  DateTime? get logTime => _logTime;
  bool hasLogTime() => _logTime != null;

  // "log_user_name" field.
  String? _logUserName;
  String get logUserName => _logUserName ?? '';
  bool hasLogUserName() => _logUserName != null;

  // "log_user_id" field.
  String? _logUserId;
  String get logUserId => _logUserId ?? '';
  bool hasLogUserId() => _logUserId != null;

  void _initializeFields() {
    _logUserRef = snapshotData['log_user_ref'] as DocumentReference?;
    _logType = deserializeEnum<LogType>(snapshotData['log_type']);
    _logTime = snapshotData['log_time'] as DateTime?;
    _logUserName = snapshotData['log_user_name'] as String?;
    _logUserId = snapshotData['log_user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('log');

  static Stream<LogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogRecord.fromSnapshot(s));

  static Future<LogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogRecord.fromSnapshot(s));

  static LogRecord fromSnapshot(DocumentSnapshot snapshot) => LogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogRecordData({
  DocumentReference? logUserRef,
  LogType? logType,
  DateTime? logTime,
  String? logUserName,
  String? logUserId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'log_user_ref': logUserRef,
      'log_type': logType,
      'log_time': logTime,
      'log_user_name': logUserName,
      'log_user_id': logUserId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogRecordDocumentEquality implements Equality<LogRecord> {
  const LogRecordDocumentEquality();

  @override
  bool equals(LogRecord? e1, LogRecord? e2) {
    return e1?.logUserRef == e2?.logUserRef &&
        e1?.logType == e2?.logType &&
        e1?.logTime == e2?.logTime &&
        e1?.logUserName == e2?.logUserName &&
        e1?.logUserId == e2?.logUserId;
  }

  @override
  int hash(LogRecord? e) => const ListEquality().hash(
      [e?.logUserRef, e?.logType, e?.logTime, e?.logUserName, e?.logUserId]);

  @override
  bool isValidKey(Object? o) => o is LogRecord;
}
