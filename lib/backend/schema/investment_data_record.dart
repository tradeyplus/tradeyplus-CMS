import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestmentDataRecord extends FirestoreRecord {
  InvestmentDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "investor_evaluation" field.
  double? _investorEvaluation;
  double get investorEvaluation => _investorEvaluation ?? 0.0;
  bool hasInvestorEvaluation() => _investorEvaluation != null;

  // "profit_ratio" field.
  double? _profitRatio;
  double get profitRatio => _profitRatio ?? 0.0;
  bool hasProfitRatio() => _profitRatio != null;

  // "investment_ref" field.
  DocumentReference? _investmentRef;
  DocumentReference? get investmentRef => _investmentRef;
  bool hasInvestmentRef() => _investmentRef != null;

  // "investor_ref" field.
  DocumentReference? _investorRef;
  DocumentReference? get investorRef => _investorRef;
  bool hasInvestorRef() => _investorRef != null;

  // "transaction_type" field.
  TransactionType? _transactionType;
  TransactionType? get transactionType => _transactionType;
  bool hasTransactionType() => _transactionType != null;

  // "investment_id" field.
  String? _investmentId;
  String get investmentId => _investmentId ?? '';
  bool hasInvestmentId() => _investmentId != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "points" field.
  double? _points;
  double get points => _points ?? 0.0;
  bool hasPoints() => _points != null;

  // "investor_id" field.
  String? _investorId;
  String get investorId => _investorId ?? '';
  bool hasInvestorId() => _investorId != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _investorEvaluation =
        castToType<double>(snapshotData['investor_evaluation']);
    _profitRatio = castToType<double>(snapshotData['profit_ratio']);
    _investmentRef = snapshotData['investment_ref'] as DocumentReference?;
    _investorRef = snapshotData['investor_ref'] as DocumentReference?;
    _transactionType =
        deserializeEnum<TransactionType>(snapshotData['transaction_type']);
    _investmentId = snapshotData['investment_id'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _points = castToType<double>(snapshotData['points']);
    _investorId = snapshotData['investor_id'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _balance = castToType<double>(snapshotData['Balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('investment_data');

  static Stream<InvestmentDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvestmentDataRecord.fromSnapshot(s));

  static Future<InvestmentDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvestmentDataRecord.fromSnapshot(s));

  static InvestmentDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvestmentDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvestmentDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvestmentDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvestmentDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvestmentDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvestmentDataRecordData({
  double? amount,
  double? investorEvaluation,
  double? profitRatio,
  DocumentReference? investmentRef,
  DocumentReference? investorRef,
  TransactionType? transactionType,
  String? investmentId,
  int? duration,
  double? points,
  String? investorId,
  DateTime? createdDate,
  double? balance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'investor_evaluation': investorEvaluation,
      'profit_ratio': profitRatio,
      'investment_ref': investmentRef,
      'investor_ref': investorRef,
      'transaction_type': transactionType,
      'investment_id': investmentId,
      'duration': duration,
      'points': points,
      'investor_id': investorId,
      'created_date': createdDate,
      'Balance': balance,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvestmentDataRecordDocumentEquality
    implements Equality<InvestmentDataRecord> {
  const InvestmentDataRecordDocumentEquality();

  @override
  bool equals(InvestmentDataRecord? e1, InvestmentDataRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.investorEvaluation == e2?.investorEvaluation &&
        e1?.profitRatio == e2?.profitRatio &&
        e1?.investmentRef == e2?.investmentRef &&
        e1?.investorRef == e2?.investorRef &&
        e1?.transactionType == e2?.transactionType &&
        e1?.investmentId == e2?.investmentId &&
        e1?.duration == e2?.duration &&
        e1?.points == e2?.points &&
        e1?.investorId == e2?.investorId &&
        e1?.createdDate == e2?.createdDate &&
        e1?.balance == e2?.balance;
  }

  @override
  int hash(InvestmentDataRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.investorEvaluation,
        e?.profitRatio,
        e?.investmentRef,
        e?.investorRef,
        e?.transactionType,
        e?.investmentId,
        e?.duration,
        e?.points,
        e?.investorId,
        e?.createdDate,
        e?.balance
      ]);

  @override
  bool isValidKey(Object? o) => o is InvestmentDataRecord;
}
