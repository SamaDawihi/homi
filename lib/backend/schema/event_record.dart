import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "isAllDay" field.
  bool? _isAllDay;
  bool get isAllDay => _isAllDay ?? false;
  bool hasIsAllDay() => _isAllDay != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  bool hasFamilyId() => _familyId != null;

  // "notifyBefore" field.
  int? _notifyBefore;
  int get notifyBefore => _notifyBefore ?? 0;
  bool hasNotifyBefore() => _notifyBefore != null;

  // "notifyBeforeUnit" field.
  String? _notifyBeforeUnit;
  String get notifyBeforeUnit => _notifyBeforeUnit ?? '';
  bool hasNotifyBeforeUnit() => _notifyBeforeUnit != null;

  // "isGoogleEvent" field.
  bool? _isGoogleEvent;
  bool get isGoogleEvent => _isGoogleEvent ?? false;
  bool hasIsGoogleEvent() => _isGoogleEvent != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _location = snapshotData['location'] as String?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _isAllDay = snapshotData['isAllDay'] as bool?;
    _familyId = snapshotData['familyId'] as DocumentReference?;
    _notifyBefore = castToType<int>(snapshotData['notifyBefore']);
    _notifyBeforeUnit = snapshotData['notifyBeforeUnit'] as String?;
    _isGoogleEvent = snapshotData['isGoogleEvent'] as bool?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? title,
  String? description,
  DocumentReference? createdBy,
  String? location,
  DateTime? startTime,
  DateTime? endTime,
  bool? isAllDay,
  DocumentReference? familyId,
  int? notifyBefore,
  String? notifyBeforeUnit,
  bool? isGoogleEvent,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'createdBy': createdBy,
      'location': location,
      'startTime': startTime,
      'endTime': endTime,
      'isAllDay': isAllDay,
      'familyId': familyId,
      'notifyBefore': notifyBefore,
      'notifyBeforeUnit': notifyBeforeUnit,
      'isGoogleEvent': isGoogleEvent,
      'startDate': startDate,
      'endDate': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.location == e2?.location &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.isAllDay == e2?.isAllDay &&
        e1?.familyId == e2?.familyId &&
        e1?.notifyBefore == e2?.notifyBefore &&
        e1?.notifyBeforeUnit == e2?.notifyBeforeUnit &&
        e1?.isGoogleEvent == e2?.isGoogleEvent &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdBy,
        e?.location,
        e?.startTime,
        e?.endTime,
        e?.isAllDay,
        e?.familyId,
        e?.notifyBefore,
        e?.notifyBeforeUnit,
        e?.isGoogleEvent,
        e?.startDate,
        e?.endDate
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
