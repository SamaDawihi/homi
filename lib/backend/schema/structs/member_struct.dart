// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberStruct extends FFFirebaseStruct {
  MemberStruct({
    DocumentReference? memberId,
    DocumentReference? familyId,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memberId = memberId,
        _familyId = familyId,
        _color = color,
        super(firestoreUtilData);

  // "memberId" field.
  DocumentReference? _memberId;
  DocumentReference? get memberId => _memberId;
  set memberId(DocumentReference? val) => _memberId = val;
  bool hasMemberId() => _memberId != null;

  // "familyId" field.
  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  set familyId(DocumentReference? val) => _familyId = val;
  bool hasFamilyId() => _familyId != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  static MemberStruct fromMap(Map<String, dynamic> data) => MemberStruct(
        memberId: data['memberId'] as DocumentReference?,
        familyId: data['familyId'] as DocumentReference?,
        color: getSchemaColor(data['color']),
      );

  static MemberStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MemberStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'memberId': _memberId,
        'familyId': _familyId,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'memberId': serializeParam(
          _memberId,
          ParamType.DocumentReference,
        ),
        'familyId': serializeParam(
          _familyId,
          ParamType.DocumentReference,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static MemberStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemberStruct(
        memberId: deserializeParam(
          data['memberId'],
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
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'MemberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberStruct &&
        memberId == other.memberId &&
        familyId == other.familyId &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([memberId, familyId, color]);
}

MemberStruct createMemberStruct({
  DocumentReference? memberId,
  DocumentReference? familyId,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MemberStruct(
      memberId: memberId,
      familyId: familyId,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MemberStruct? updateMemberStruct(
  MemberStruct? member, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    member
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMemberStructData(
  Map<String, dynamic> firestoreData,
  MemberStruct? member,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (member == null) {
    return;
  }
  if (member.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && member.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final memberData = getMemberFirestoreData(member, forFieldValue);
  final nestedData = memberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = member.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMemberFirestoreData(
  MemberStruct? member, [
  bool forFieldValue = false,
]) {
  if (member == null) {
    return {};
  }
  final firestoreData = mapToFirestore(member.toMap());

  // Add any Firestore field values
  member.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMemberListFirestoreData(
  List<MemberStruct>? members,
) =>
    members?.map((e) => getMemberFirestoreData(e, true)).toList() ?? [];
