import 'package:cherry_mvp/pages/bottomNavigationPages/AuthenticationPage.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

// Import root pages
import 'package:cherry_mvp/pages/ErrorPage.dart';
import 'package:cherry_mvp/pages/NavigationPage.dart';
import 'package:cherry_mvp/pages/LoadingPage.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "Firebase Flutter Demo",
      home: AuthenticationPage()
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorPage();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const NavigationPage();
          }

          return const LoadingPage();
        }
    );
  }
}