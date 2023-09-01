import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  FamilyStruct _currentFamily = FamilyStruct();
  FamilyStruct get currentFamily => _currentFamily;
  set currentFamily(FamilyStruct _value) {
    _currentFamily = _value;
  }

  void updateCurrentFamilyStruct(Function(FamilyStruct) updateFn) {
    updateFn(_currentFamily);
  }

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
