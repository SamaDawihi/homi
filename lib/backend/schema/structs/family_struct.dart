// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamilyStruct extends FFFirebaseStruct {
  FamilyStruct({
    String? name,
    DocumentReference? adminId,
    String? photot,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _adminId = adminId,
        _photot = photot,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "adminId" field.
  DocumentReference? _adminId;
  DocumentReference? get adminId => _adminId;
  set adminId(DocumentReference? val) => _adminId = val;
  bool hasAdminId() => _adminId != null;

  // "photot" field.
  String? _photot;
  String get photot => _photot ?? '';
  set photot(String? val) => _photot = val;
  bool hasPhotot() => _photot != null;

  static FamilyStruct fromMap(Map<String, dynamic> data) => FamilyStruct(
        name: data['name'] as String?,
        adminId: data['adminId'] as DocumentReference?,
        photot: data['photot'] as String?,
      );

  static FamilyStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FamilyStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'adminId': _adminId,
        'photot': _photot,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'adminId': serializeParam(
          _adminId,
          ParamType.DocumentReference,
        ),
        'photot': serializeParam(
          _photot,
          ParamType.String,
        ),
      }.withoutNulls;

  static FamilyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FamilyStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        adminId: deserializeParam(
          data['adminId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        photot: deserializeParam(
          data['photot'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FamilyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FamilyStruct &&
        name == other.name &&
        adminId == other.adminId &&
        photot == other.photot;
  }

  @override
  int get hashCode => const ListEquality().hash([name, adminId, photot]);
}

FamilyStruct createFamilyStruct({
  String? name,
  DocumentReference? adminId,
  String? photot,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FamilyStruct(
      name: name,
      adminId: adminId,
      photot: photot,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FamilyStruct? updateFamilyStruct(
  FamilyStruct? family, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    family
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFamilyStructData(
  Map<String, dynamic> firestoreData,
  FamilyStruct? family,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (family == null) {
    return;
  }
  if (family.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && family.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final familyData = getFamilyFirestoreData(family, forFieldValue);
  final nestedData = familyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = family.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFamilyFirestoreData(
  FamilyStruct? family, [
  bool forFieldValue = false,
]) {
  if (family == null) {
    return {};
  }
  final firestoreData = mapToFirestore(family.toMap());

  // Add any Firestore field values
  family.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFamilyListFirestoreData(
  List<FamilyStruct>? familys,
) =>
    familys?.map((e) => getFamilyFirestoreData(e, true)).toList() ?? [];
