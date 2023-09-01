import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamilyRecord extends FirestoreRecord {
  FamilyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "adminId" field.
  DocumentReference? _adminId;
  DocumentReference? get adminId => _adminId;
  bool hasAdminId() => _adminId != null;

  // "photo-url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _adminId = snapshotData['adminId'] as DocumentReference?;
    _photoUrl = snapshotData['photo-url'] as String?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Family');

  static Stream<FamilyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FamilyRecord.fromSnapshot(s));

  static Future<FamilyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FamilyRecord.fromSnapshot(s));

  static FamilyRecord fromSnapshot(DocumentSnapshot snapshot) => FamilyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FamilyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FamilyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FamilyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FamilyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFamilyRecordData({
  String? name,
  DocumentReference? adminId,
  String? photoUrl,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'adminId': adminId,
      'photo-url': photoUrl,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class FamilyRecordDocumentEquality implements Equality<FamilyRecord> {
  const FamilyRecordDocumentEquality();

  @override
  bool equals(FamilyRecord? e1, FamilyRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.adminId == e2?.adminId &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.color == e2?.color;
  }

  @override
  int hash(FamilyRecord? e) =>
      const ListEquality().hash([e?.name, e?.adminId, e?.photoUrl, e?.color]);

  @override
  bool isValidKey(Object? o) => o is FamilyRecord;
}
