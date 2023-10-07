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

  testWidgets('Add Event Test', (WidgetTester tester) async {
    _overrideOnError();
    await initFirebase();
    await FirebaseAuth.instance.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'rana@gmail.com', password: 'rana1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));

    await tester.pumpAndSettle(
      Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('AddIconButton_k0mf')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('title_7gp0')), findsWidgets);
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.enterText(find.byKey(ValueKey('title_7gp0')), 'غداء الجمعة');
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('Icon_pz05')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 1000),
    );
    await tester.tap(find.byKey(ValueKey('Icon_p9ik')));
    await tester.tap(find.byKey(ValueKey('Button_nxg8')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_mlr8')), findsWidgets);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('Button_isxu')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_ng7f')), findsWidgets);
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('Button_rqlt')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_mlr8')), findsWidgets);
  });

  testWidgets('Send Notification Test', (WidgetTester tester) async {
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('NotificationSwitch_47gl')));
    await tester.enterText(find.byKey(ValueKey('TextField_w8p1')), '15');
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('DropDown_4o3e')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('Button_nxg8')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_mlr8')), findsWidgets);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('Button_9e2t')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('DeleteEvent')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_mlr8')), findsWidgets);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('EventDisplay_bukj')),
      matching: find.byKey(ValueKey('Icon_drqh')),
    ));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Text_36gd')), findsWidgets);
  });

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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('FamilyMemberContainer_2l6r')),
      matching: find.byKey(ValueKey('Icon_pf0p')),
    ));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('Admin '), findsOneWidget);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('FamilyMemberContainer_2l6r')),
      matching: find.byKey(ValueKey('Icon_nl8s')),
    ));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('Remove Member'), findsOneWidget);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('LeaveFamilyButton_upt0')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('Leave Family'), findsWidgets);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('DeleteButton_7g29')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('DeleteFamily')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('Family Deleted'), findsWidgets);
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 1000),
    );
    expect(find.text('October'), findsWidgets);
  });

  testWidgets('Get Google Events Test', (WidgetTester tester) async {
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

    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(ValueKey('LinkGoogleIconButton_y1l2')));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.text('Add'), findsWidgets);
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 1000),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 2000),
    );
    expect(find.byKey(ValueKey('Calendar_8619')), findsWidgets);
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
