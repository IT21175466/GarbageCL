import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garbagecl/providers/user_provider.dart';
import 'package:garbagecl/screens/user_home/user_home_page.dart';
import 'package:provider/provider.dart';

class DataLoadSplash extends StatefulWidget {
  const DataLoadSplash({super.key});

  @override
  State<DataLoadSplash> createState() => _DataLoadSplashState();
}

class _DataLoadSplashState extends State<DataLoadSplash> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getUserID();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomePage(),
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
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 50,
              //width: 150,
              child: Image.asset('assets/images/garbagecl_green.png'),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Loading infomation.....',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
