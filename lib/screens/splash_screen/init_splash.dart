import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garbagecl/screens/authentication/login_screen.dart';

class InitialSplash extends StatefulWidget {
  const InitialSplash({super.key});

  @override
  State<InitialSplash> createState() => _InitialSplashState();
}

class _InitialSplashState extends State<InitialSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.green,
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 50,
              //width: 150,
              child: Image.asset('assets/images/garbagecl.png'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
