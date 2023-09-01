import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitationRecord extends FirestoreRecord {
  InvitationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "invitedEmail" field.
  String? _invitedEmail;
  String get invitedEmail => _invitedEmail ?? '';
  bool hasInvitedEmail() => _invitedEmail != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _invitedEmail = snapshotData['invitedEmail'] as String?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invitation');

  static Stream<InvitationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvitationRecord.fromSnapshot(s));

  static Future<InvitationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvitationRecord.fromSnapshot(s));

  static InvitationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvitationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvitationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvitationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvitationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvitationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvitationRecordData({
  String? invitedEmail,
  DocumentReference? familyId,
  String? status,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'invitedEmail': invitedEmail,
      'familyId': familyId,
      'status': status,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvitationRecordDocumentEquality implements Equality<InvitationRecord> {
  const InvitationRecordDocumentEquality();

  @override
  bool equals(InvitationRecord? e1, InvitationRecord? e2) {
    return e1?.invitedEmail == e2?.invitedEmail &&
        e1?.familyId == e2?.familyId &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(InvitationRecord? e) => const ListEquality()
      .hash([e?.invitedEmail, e?.familyId, e?.status, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is InvitationRecord;
}
