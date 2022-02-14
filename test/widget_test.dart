// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fire_idea_project/service/welcome_page_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fire_idea_project/main.dart';

void main() {

  // testWidgets('test connoction state', (tester)async{
  //
  //   await Firebase.initializeApp(
  //       options:const  FirebaseOptions(
  //           apiKey: "AIzaSyDK851PCEgINMR-Ck1-eEzFIlc52rIPhVo",
  //           appId: "1:952427878196:web:f4e840d330e26cdfd8b761",
  //           messagingSenderId: "952427878196",
  //           projectId:  "fire-idea"));
  //   WelcomePageService welcomePageService=WelcomePageService();
  // welcomePageService.getAllImage;
  // });
  // // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  // //   // Build our app and trigger a frame.
  // //   await tester.pumpWidget(const MyApp());
  // //
  // //   // Verify that our counter starts at 0.
  // //   expect(find.text('0'), findsOneWidget);
  // //   expect(find.text('1'), findsNothing);
  // //
  // //   // Tap the '+' icon and trigger a frame.
  // //   await tester.tap(find.byIcon(Icons.add));
  // //   await tester.pump();
  // //
  // //   // Verify that our counter has incremented.
  // //   expect(find.text('0'), findsNothing);
  // //   expect(find.text('1'), findsOneWidget);
  // // });
}
