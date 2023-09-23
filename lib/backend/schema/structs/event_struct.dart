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
    DocumentReference? createdBy,
    String? location,
    DateTime? startTime,
    bool? isAllDay,
    DocumentReference? familyId,
    int? notifyBefore,
    String? notifyBeforeUnit,
    bool? isGoogleEvent,
    DateTime? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _createdBy = createdBy,
        _location = location,
        _startTime = startTime,
        _isAllDay = isAllDay,
        _familyId = familyId,
        _notifyBefore = notifyBefore,
        _notifyBeforeUnit = notifyBeforeUnit,
        _isGoogleEvent = isGoogleEvent,
        _endTime = endTime,
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

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;
  bool hasCreatedBy() => _createdBy != null;

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

  // "isAllDay" field.
  bool? _isAllDay;
  bool get isAllDay => _isAllDay ?? false;
  set isAllDay(bool? val) => _isAllDay = val;
  bool hasIsAllDay() => _isAllDay != null;

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

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        createdBy: data['createdBy'] as DocumentReference?,
        location: data['location'] as String?,
        startTime: data['startTime'] as DateTime?,
        isAllDay: data['isAllDay'] as bool?,
        familyId: data['familyId'] as DocumentReference?,
        notifyBefore: castToType<int>(data['notifyBefore']),
        notifyBeforeUnit: data['notifyBeforeUnit'] as String?,
        isGoogleEvent: data['isGoogleEvent'] as bool?,
        endTime: data['endTime'] as DateTime?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EventStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'createdBy': _createdBy,
        'location': _location,
        'startTime': _startTime,
        'isAllDay': _isAllDay,
        'familyId': _familyId,
        'notifyBefore': _notifyBefore,
        'notifyBeforeUnit': _notifyBeforeUnit,
        'isGoogleEvent': _isGoogleEvent,
        'endTime': _endTime,
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
        'createdBy': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'isAllDay': serializeParam(
          _isAllDay,
          ParamType.bool,
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
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
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
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
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
        isAllDay: deserializeParam(
          data['isAllDay'],
          ParamType.bool,
          false,
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
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
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
        createdBy == other.createdBy &&
        location == other.location &&
        startTime == other.startTime &&
        isAllDay == other.isAllDay &&
        familyId == other.familyId &&
        notifyBefore == other.notifyBefore &&
        notifyBeforeUnit == other.notifyBeforeUnit &&
        isGoogleEvent == other.isGoogleEvent &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        createdBy,
        location,
        startTime,
        isAllDay,
        familyId,
        notifyBefore,
        notifyBeforeUnit,
        isGoogleEvent,
        endTime
      ]);
}

EventStruct createEventStruct({
  String? title,
  String? description,
  DocumentReference? createdBy,
  String? location,
  DateTime? startTime,
  bool? isAllDay,
  DocumentReference? familyId,
  int? notifyBefore,
  String? notifyBeforeUnit,
  bool? isGoogleEvent,
  DateTime? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStruct(
      title: title,
      description: description,
      createdBy: createdBy,
      location: location,
      startTime: startTime,
      isAllDay: isAllDay,
      familyId: familyId,
      notifyBefore: notifyBefore,
      notifyBeforeUnit: notifyBeforeUnit,
      isGoogleEvent: isGoogleEvent,
      endTime: endTime,
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
