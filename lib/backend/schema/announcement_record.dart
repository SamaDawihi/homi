import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnnouncementRecord extends FirestoreRecord {
  AnnouncementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _image = snapshotData['image'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Announcement');

  static Stream<AnnouncementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnnouncementRecord.fromSnapshot(s));

  static Future<AnnouncementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnnouncementRecord.fromSnapshot(s));

  static AnnouncementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnnouncementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnnouncementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnnouncementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnnouncementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnnouncementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnnouncementRecordData({
  String? message,
  String? image,
  DocumentReference? createdBy,
  DateTime? createdAt,
  DocumentReference? familyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'image': image,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'familyId': familyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnnouncementRecordDocumentEquality
    implements Equality<AnnouncementRecord> {
  const AnnouncementRecordDocumentEquality();

  @override
  bool equals(AnnouncementRecord? e1, AnnouncementRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.image == e2?.image &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.familyId == e2?.familyId;
  }

  @override
  int hash(AnnouncementRecord? e) => const ListEquality()
      .hash([e?.message, e?.image, e?.createdBy, e?.createdAt, e?.familyId]);

  @override
  bool isValidKey(Object? o) => o is AnnouncementRecord;
}
