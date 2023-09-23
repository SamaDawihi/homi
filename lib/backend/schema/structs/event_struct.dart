// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends FFFirebaseStruct {
  EventStruct({
    String? title,
    String? description,
    String? location,
    DateTime? startTime,
    DateTime? startDate,
    DateTime? endTime,
    DateTime? endDate,
    bool? isAllDay,
    DocumentReference? createdBy,
    DocumentReference? familyId,
    int? notifyBefore,
    String? notifyBeforeUnit,
    bool? isGoogleEvent,
    bool? dontShareThisEvent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _location = location,
        _startTime = startTime,
        _startDate = startDate,
        _endTime = endTime,
        _endDate = endDate,
        _isAllDay = isAllDay,
        _createdBy = createdBy,
        _familyId = familyId,
        _notifyBefore = notifyBefore,
        _notifyBeforeUnit = notifyBeforeUnit,
        _isGoogleEvent = isGoogleEvent,
        _dontShareThisEvent = dontShareThisEvent,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "isAllDay" field.
  bool? _isAllDay;
  bool get isAllDay => _isAllDay ?? false;
  set isAllDay(bool? val) => _isAllDay = val;
  bool hasIsAllDay() => _isAllDay != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;
  bool hasCreatedBy() => _createdBy != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  set familyId(DocumentReference? val) => _familyId = val;
  bool hasFamilyId() => _familyId != null;

  // "notifyBefore" field.
  int? _notifyBefore;
  int get notifyBefore => _notifyBefore ?? 0;
  set notifyBefore(int? val) => _notifyBefore = val;
  void incrementNotifyBefore(int amount) =>
      _notifyBefore = notifyBefore + amount;
  bool hasNotifyBefore() => _notifyBefore != null;

  // "notifyBeforeUnit" field.
  String? _notifyBeforeUnit;
  String get notifyBeforeUnit => _notifyBeforeUnit ?? '';
  set notifyBeforeUnit(String? val) => _notifyBeforeUnit = val;
  bool hasNotifyBeforeUnit() => _notifyBeforeUnit != null;

  // "isGoogleEvent" field.
  bool? _isGoogleEvent;
  bool get isGoogleEvent => _isGoogleEvent ?? false;
  set isGoogleEvent(bool? val) => _isGoogleEvent = val;
  bool hasIsGoogleEvent() => _isGoogleEvent != null;

  // "dontShareThisEvent" field.
  bool? _dontShareThisEvent;
  bool get dontShareThisEvent => _dontShareThisEvent ?? false;
  set dontShareThisEvent(bool? val) => _dontShareThisEvent = val;
  bool hasDontShareThisEvent() => _dontShareThisEvent != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        location: data['location'] as String?,
        startTime: data['startTime'] as DateTime?,
        startDate: data['startDate'] as DateTime?,
        endTime: data['endTime'] as DateTime?,
        endDate: data['endDate'] as DateTime?,
        isAllDay: data['isAllDay'] as bool?,
        createdBy: data['createdBy'] as DocumentReference?,
        familyId: data['familyId'] as DocumentReference?,
        notifyBefore: castToType<int>(data['notifyBefore']),
        notifyBeforeUnit: data['notifyBeforeUnit'] as String?,
        isGoogleEvent: data['isGoogleEvent'] as bool?,
        dontShareThisEvent: data['dontShareThisEvent'] as bool?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EventStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'location': _location,
        'startTime': _startTime,
        'startDate': _startDate,
        'endTime': _endTime,
        'endDate': _endDate,
        'isAllDay': _isAllDay,
        'createdBy': _createdBy,
        'familyId': _familyId,
        'notifyBefore': _notifyBefore,
        'notifyBeforeUnit': _notifyBeforeUnit,
        'isGoogleEvent': _isGoogleEvent,
        'dontShareThisEvent': _dontShareThisEvent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'isAllDay': serializeParam(
          _isAllDay,
          ParamType.bool,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'familyId': serializeParam(
          _familyId,
          ParamType.DocumentReference,
        ),
        'notifyBefore': serializeParam(
          _notifyBefore,
          ParamType.int,
        ),
        'notifyBeforeUnit': serializeParam(
          _notifyBeforeUnit,
          ParamType.String,
        ),
        'isGoogleEvent': serializeParam(
          _isGoogleEvent,
          ParamType.bool,
        ),
        'dontShareThisEvent': serializeParam(
          _dontShareThisEvent,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
        isAllDay: deserializeParam(
          data['isAllDay'],
          ParamType.bool,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        familyId: deserializeParam(
          data['familyId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Family'],
        ),
        notifyBefore: deserializeParam(
          data['notifyBefore'],
          ParamType.int,
          false,
        ),
        notifyBeforeUnit: deserializeParam(
          data['notifyBeforeUnit'],
          ParamType.String,
          false,
        ),
        isGoogleEvent: deserializeParam(
          data['isGoogleEvent'],
          ParamType.bool,
          false,
        ),
        dontShareThisEvent: deserializeParam(
          data['dontShareThisEvent'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventStruct &&
        title == other.title &&
        description == other.description &&
        location == other.location &&
        startTime == other.startTime &&
        startDate == other.startDate &&
        endTime == other.endTime &&
        endDate == other.endDate &&
        isAllDay == other.isAllDay &&
        createdBy == other.createdBy &&
        familyId == other.familyId &&
        notifyBefore == other.notifyBefore &&
        notifyBeforeUnit == other.notifyBeforeUnit &&
        isGoogleEvent == other.isGoogleEvent &&
        dontShareThisEvent == other.dontShareThisEvent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        location,
        startTime,
        startDate,
        endTime,
        endDate,
        isAllDay,
        createdBy,
        familyId,
        notifyBefore,
        notifyBeforeUnit,
        isGoogleEvent,
        dontShareThisEvent
      ]);
}

EventStruct createEventStruct({
  String? title,
  String? description,
  String? location,
  DateTime? startTime,
  DateTime? startDate,
  DateTime? endTime,
  DateTime? endDate,
  bool? isAllDay,
  DocumentReference? createdBy,
  DocumentReference? familyId,
  int? notifyBefore,
  String? notifyBeforeUnit,
  bool? isGoogleEvent,
  bool? dontShareThisEvent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStruct(
      title: title,
      description: description,
      location: location,
      startTime: startTime,
      startDate: startDate,
      endTime: endTime,
      endDate: endDate,
      isAllDay: isAllDay,
      createdBy: createdBy,
      familyId: familyId,
      notifyBefore: notifyBefore,
      notifyBeforeUnit: notifyBeforeUnit,
      isGoogleEvent: isGoogleEvent,
      dontShareThisEvent: dontShareThisEvent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventStruct? updateEventStruct(
  EventStruct? event, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    event
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventStructData(
  Map<String, dynamic> firestoreData,
  EventStruct? event,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (event == null) {
    return;
  }
  if (event.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && event.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventData = getEventFirestoreData(event, forFieldValue);
  final nestedData = eventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = event.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventFirestoreData(
  EventStruct? event, [
  bool forFieldValue = false,
]) {
  if (event == null) {
    return {};
  }
  final firestoreData = mapToFirestore(event.toMap());

  // Add any Firestore field values
  event.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventListFirestoreData(
  List<EventStruct>? events,
) =>
    events?.map((e) => getEventFirestoreData(e, true)).toList() ?? [];
