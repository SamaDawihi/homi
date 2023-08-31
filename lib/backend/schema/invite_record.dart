import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InviteRecord extends FirestoreRecord {
  InviteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "invitedId" field.
  DocumentReference? _invitedId;
  DocumentReference? get invitedId => _invitedId;
  bool hasInvitedId() => _invitedId != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _invitedId = snapshotData['invitedId'] as DocumentReference?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invite');

  static Stream<InviteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InviteRecord.fromSnapshot(s));

  static Future<InviteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InviteRecord.fromSnapshot(s));

  static InviteRecord fromSnapshot(DocumentSnapshot snapshot) => InviteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InviteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InviteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InviteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InviteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInviteRecordData({
  DocumentReference? invitedId,
  DocumentReference? familyId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'invitedId': invitedId,
      'familyId': familyId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class InviteRecordDocumentEquality implements Equality<InviteRecord> {
  const InviteRecordDocumentEquality();

  @override
  bool equals(InviteRecord? e1, InviteRecord? e2) {
    return e1?.invitedId == e2?.invitedId &&
        e1?.familyId == e2?.familyId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(InviteRecord? e) =>
      const ListEquality().hash([e?.invitedId, e?.familyId, e?.status]);

  @override
  bool isValidKey(Object? o) => o is InviteRecord;
}
