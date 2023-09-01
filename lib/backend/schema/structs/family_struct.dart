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
    String? photo,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _adminId = adminId,
        _photo = photo,
        _color = color,
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

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  static FamilyStruct fromMap(Map<String, dynamic> data) => FamilyStruct(
        name: data['name'] as String?,
        adminId: data['adminId'] as DocumentReference?,
        photo: data['photo'] as String?,
        color: getSchemaColor(data['color']),
      );

  static FamilyStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FamilyStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'adminId': _adminId,
        'photo': _photo,
        'color': _color,
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
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
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
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
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
        photo == other.photo &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([name, adminId, photo, color]);
}

FamilyStruct createFamilyStruct({
  String? name,
  DocumentReference? adminId,
  String? photo,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FamilyStruct(
      name: name,
      adminId: adminId,
      photo: photo,
      color: color,
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
