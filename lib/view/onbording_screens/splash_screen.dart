import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/ui_helper.dart';
import 'package:task/util/colors.dart';
import 'package:task/view/ui_screens/home_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreens(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColors,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            hSpectre(),
            Text(
              "Todo List",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }

  Widget Logo() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Image.asset("assets/images/to-do-list.png"),
    );
  }
}
