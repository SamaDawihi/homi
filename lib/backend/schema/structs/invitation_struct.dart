// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvitationStruct extends FFFirebaseStruct {
  InvitationStruct({
    String? invitedEmail,
    DocumentReference? familiyId,
    String? status,
    DateTime? createdTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _invitedEmail = invitedEmail,
        _familiyId = familiyId,
        _status = status,
        _createdTime = createdTime,
        super(firestoreUtilData);

  // "invitedEmail" field.
  String? _invitedEmail;
  String get invitedEmail => _invitedEmail ?? '';
  set invitedEmail(String? val) => _invitedEmail = val;
  bool hasInvitedEmail() => _invitedEmail != null;

  // "familiyId" field.
  DocumentReference? _familiyId;
  DocumentReference? get familiyId => _familiyId;
  set familiyId(DocumentReference? val) => _familiyId = val;
  bool hasFamiliyId() => _familiyId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  static InvitationStruct fromMap(Map<String, dynamic> data) =>
      InvitationStruct(
        invitedEmail: data['invitedEmail'] as String?,
        familiyId: data['familiyId'] as DocumentReference?,
        status: data['status'] as String?,
        createdTime: data['created_time'] as DateTime?,
      );

  static InvitationStruct? maybeFromMap(dynamic data) => data is Map
      ? InvitationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'invitedEmail': _invitedEmail,
        'familiyId': _familiyId,
        'status': _status,
        'created_time': _createdTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'invitedEmail': serializeParam(
          _invitedEmail,
          ParamType.String,
        ),
        'familiyId': serializeParam(
          _familiyId,
          ParamType.DocumentReference,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static InvitationStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvitationStruct(
        invitedEmail: deserializeParam(
          data['invitedEmail'],
          ParamType.String,
          false,
        ),
        familiyId: deserializeParam(
          data['familiyId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Family'],
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'InvitationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvitationStruct &&
        invitedEmail == other.invitedEmail &&
        familiyId == other.familiyId &&
        status == other.status &&
        createdTime == other.createdTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([invitedEmail, familiyId, status, createdTime]);
}

InvitationStruct createInvitationStruct({
  String? invitedEmail,
  DocumentReference? familiyId,
  String? status,
  DateTime? createdTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvitationStruct(
      invitedEmail: invitedEmail,
      familiyId: familiyId,
      status: status,
      createdTime: createdTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvitationStruct? updateInvitationStruct(
  InvitationStruct? invitation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invitation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvitationStructData(
  Map<String, dynamic> firestoreData,
  InvitationStruct? invitation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invitation == null) {
    return;
  }
  if (invitation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invitation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invitationData = getInvitationFirestoreData(invitation, forFieldValue);
  final nestedData = invitationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invitation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvitationFirestoreData(
  InvitationStruct? invitation, [
  bool forFieldValue = false,
]) {
  if (invitation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invitation.toMap());

  // Add any Firestore field values
  invitation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvitationListFirestoreData(
  List<InvitationStruct>? invitations,
) =>
    invitations?.map((e) => getInvitationFirestoreData(e, true)).toList() ?? [];
