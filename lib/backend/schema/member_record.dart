import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberRecord extends FirestoreRecord {
  MemberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "memberId" field.
  DocumentReference? _memberId;
  DocumentReference? get memberId => _memberId;
  bool hasMemberId() => _memberId != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _memberId = snapshotData['memberId'] as DocumentReference?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _color = getSchemaColor(snapshotData['color']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Member');

  static Stream<MemberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemberRecord.fromSnapshot(s));

  static Future<MemberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemberRecord.fromSnapshot(s));

  static MemberRecord fromSnapshot(DocumentSnapshot snapshot) => MemberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemberRecordData({
  DocumentReference? memberId,
  DocumentReference? familyId,
  Color? color,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'memberId': memberId,
      'familyId': familyId,
      'color': color,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemberRecordDocumentEquality implements Equality<MemberRecord> {
  const MemberRecordDocumentEquality();

  @override
  bool equals(MemberRecord? e1, MemberRecord? e2) {
    return e1?.memberId == e2?.memberId &&
        e1?.familyId == e2?.familyId &&
        e1?.color == e2?.color &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(MemberRecord? e) => const ListEquality()
      .hash([e?.memberId, e?.familyId, e?.color, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is MemberRecord;
}
