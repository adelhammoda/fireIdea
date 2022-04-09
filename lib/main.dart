import 'package:firebase_database/firebase_database.dart';

import './provider/home_page_provider.dart';
import './provider/theme_provider.dart';
import './provider/welcome_page_provider.dart';
import './view/home_page.dart';
import './view/welcom_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDK851PCEgINMR-Ck1-eEzFIlc52rIPhVo",
          authDomain: "fire-idea.firebaseapp.com",
          databaseURL:
              "https://fire-idea-default-rtdb.asia-southeast1.firebasedatabase.app",
          projectId: "fire-idea",
          storageBucket: "fire-idea.appspot.com",
          messagingSenderId: "952427878196",
          appId: "1:952427878196:web:f4e840d330e26cdfd8b761",
          measurementId: "G-DJ5YWL23WT"));
  await FirebaseDatabase.instance.goOnline();
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => ThemeProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider _provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      routes: {
        '/': (context) => ChangeNotifierProvider(
              child: const WelcomePage(),
              create: (context) =>  WelcomePageProvider(),
            ),
        '/${HomePage.route}': (context) => ChangeNotifierProvider(
            child: const HomePage(),
            create: (context) => HomePageProvider()),
      },
      debugShowCheckedModeBanner: false,
      title: 'Fire Idea',
      theme: ThemeData(
          //TODO:initial font and the theme for whole page
          backgroundColor: _provider.theme.backgroundColor,
          primaryColor: _provider.theme.primaryColor,
          textTheme: TextTheme(
              bodyText1: TextStyle(
            color: _provider.theme.bodyTextColor,
          ))),
    );
  }
}
