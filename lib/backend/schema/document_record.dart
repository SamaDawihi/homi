import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentRecord extends FirestoreRecord {
  DocumentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "document" field.
  String? _document;
  String get document => _document ?? '';
  bool hasDocument() => _document != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _document = snapshotData['document'] as String?;
    _link = snapshotData['link'] as String?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Document');

  static Stream<DocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentRecord.fromSnapshot(s));

  static Future<DocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentRecord.fromSnapshot(s));

  static DocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentRecordData({
  String? title,
  String? document,
  String? link,
  DocumentReference? familyId,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'document': document,
      'link': link,
      'familyId': familyId,
      'createdBy': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentRecordDocumentEquality implements Equality<DocumentRecord> {
  const DocumentRecordDocumentEquality();

  @override
  bool equals(DocumentRecord? e1, DocumentRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.document == e2?.document &&
        e1?.link == e2?.link &&
        e1?.familyId == e2?.familyId &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(DocumentRecord? e) => const ListEquality()
      .hash([e?.title, e?.document, e?.link, e?.familyId, e?.createdBy]);

  @override
  bool isValidKey(Object? o) => o is DocumentRecord;
}