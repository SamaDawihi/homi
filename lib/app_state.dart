import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _familyId = prefs.getString('ff_familyId')?.ref ?? _familyId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<MemberStruct> _currentFamilyMembers = [];
  List<MemberStruct> get currentFamilyMembers => _currentFamilyMembers;
  set currentFamilyMembers(List<MemberStruct> _value) {
    _currentFamilyMembers = _value;
  }

  void addToCurrentFamilyMembers(MemberStruct _value) {
    _currentFamilyMembers.add(_value);
  }

  void removeFromCurrentFamilyMembers(MemberStruct _value) {
    _currentFamilyMembers.remove(_value);
  }

  void removeAtIndexFromCurrentFamilyMembers(int _index) {
    _currentFamilyMembers.removeAt(_index);
  }

  void updateCurrentFamilyMembersAtIndex(
    int _index,
    MemberStruct Function(MemberStruct) updateFn,
  ) {
    _currentFamilyMembers[_index] = updateFn(_currentFamilyMembers[_index]);
  }

  void insertAtIndexInCurrentFamilyMembers(int _index, MemberStruct _value) {
    _currentFamilyMembers.insert(_index, _value);
  }

  DocumentReference? _familyId;
  DocumentReference? get familyId => _familyId;
  set familyId(DocumentReference? _value) {
    _familyId = _value;
    _value != null
        ? prefs.setString('ff_familyId', _value.path)
        : prefs.remove('ff_familyId');
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String _value) {
    _authToken = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
