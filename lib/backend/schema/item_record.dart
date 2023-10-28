import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemRecord extends FirestoreRecord {
  ItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "doneBy" field.
  DocumentReference? _doneBy;
  DocumentReference? get doneBy => _doneBy;
  bool hasDoneBy() => _doneBy != null;

  // "belongTo" field.
  DocumentReference? _belongTo;
  DocumentReference? get belongTo => _belongTo;
  bool hasBelongTo() => _belongTo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _done = snapshotData['done'] as bool?;
    _doneBy = snapshotData['doneBy'] as DocumentReference?;
    _belongTo = snapshotData['belongTo'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Item');

  static Stream<ItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemRecord.fromSnapshot(s));

  static Future<ItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemRecord.fromSnapshot(s));

  static ItemRecord fromSnapshot(DocumentSnapshot snapshot) => ItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemRecordData({
  String? name,
  bool? done,
  DocumentReference? doneBy,
  DocumentReference? belongTo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'done': done,
      'doneBy': doneBy,
      'belongTo': belongTo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemRecordDocumentEquality implements Equality<ItemRecord> {
  const ItemRecordDocumentEquality();

  @override
  bool equals(ItemRecord? e1, ItemRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.done == e2?.done &&
        e1?.doneBy == e2?.doneBy &&
        e1?.belongTo == e2?.belongTo;
  }

  @override
  int hash(ItemRecord? e) =>
      const ListEquality().hash([e?.name, e?.done, e?.doneBy, e?.belongTo]);

  @override
  bool isValidKey(Object? o) => o is ItemRecord;
}
