import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListRecord extends FirestoreRecord {
  ListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "assignedTo" field.
  List<DocumentReference>? _assignedTo;
  List<DocumentReference> get assignedTo => _assignedTo ?? const [];
  bool hasAssignedTo() => _assignedTo != null;

  // "isShoopingList" field.
  bool? _isShoopingList;
  bool get isShoopingList => _isShoopingList ?? false;
  bool hasIsShoopingList() => _isShoopingList != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _assignedTo = getDataList(snapshotData['assignedTo']);
    _isShoopingList = snapshotData['isShoopingList'] as bool?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('List');

  static Stream<ListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListRecord.fromSnapshot(s));

  static Future<ListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListRecord.fromSnapshot(s));

  static ListRecord fromSnapshot(DocumentSnapshot snapshot) => ListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListRecordData({
  String? name,
  String? description,
  DocumentReference? createdBy,
  bool? isShoopingList,
  DocumentReference? familyId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'isShoopingList': isShoopingList,
      'familyId': familyId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListRecordDocumentEquality implements Equality<ListRecord> {
  const ListRecordDocumentEquality();

  @override
  bool equals(ListRecord? e1, ListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.assignedTo, e2?.assignedTo) &&
        e1?.isShoopingList == e2?.isShoopingList &&
        e1?.familyId == e2?.familyId;
  }

  @override
  int hash(ListRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.createdBy,
        e?.assignedTo,
        e?.isShoopingList,
        e?.familyId
      ]);

  @override
  bool isValidKey(Object? o) => o is ListRecord;
}
