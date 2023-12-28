import 'package:flutter/material.dart';
import 'package:task/view/onbording_screens/splash_screen.dart';
import 'package:task/view/ui_screens/home_screens.dart';
import 'package:task/view/ui_screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: Profile(),
        home: SplashScreen());
  }
}
