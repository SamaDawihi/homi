import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:homi/main.dart';
import 'package:homi/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:homi/backend/firebase/firebase_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Make Admin Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));

    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('FamilyMemberContainer_2l6r')),
      matching: find.byKey(ValueKey('Icon_pf0p')),
    ));
    await tester.pumpAndSettle(
      Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('ConfirmChangeAdmin'), findsOneWidget);
  });

  testWidgets('Remove Member Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Leave Family', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Delete Family Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('View Events in Calendar', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Get Google Events Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('View Event Details Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Add Event Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Edit Event Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Delete Event Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'anoud@gmail.com', password: 'anoud1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });

  testWidgets('Send Notification Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
