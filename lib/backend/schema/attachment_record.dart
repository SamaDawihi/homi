import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttachmentRecord extends FirestoreRecord {
  AttachmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Attachment')
          : FirebaseFirestore.instance.collectionGroup('Attachment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Attachment').doc();

  static Stream<AttachmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttachmentRecord.fromSnapshot(s));

  static Future<AttachmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttachmentRecord.fromSnapshot(s));

  static AttachmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttachmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttachmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttachmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttachmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttachmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttachmentRecordData({
  String? name,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttachmentRecordDocumentEquality implements Equality<AttachmentRecord> {
  const AttachmentRecordDocumentEquality();

  @override
  bool equals(AttachmentRecord? e1, AttachmentRecord? e2) {
    return e1?.name == e2?.name && e1?.url == e2?.url;
  }

  @override
  int hash(AttachmentRecord? e) => const ListEquality().hash([e?.name, e?.url]);

  @override
  bool isValidKey(Object? o) => o is AttachmentRecord;
}
