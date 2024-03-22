import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/screens/driver_home/driver_home_page.dart';
import 'package:garbagecl/screens/type_selection_screen/type_selection.dart';
import 'package:garbagecl/screens/user_home/user_home_page.dart';

class LoadingSplash extends StatefulWidget {
  final String id;
  const LoadingSplash({super.key, required this.id});

  @override
  State<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  void initState() {
    super.initState();
    checkUserIsSignUp(widget.id, context);
  }

  //Check User SignUp or Not
  checkUserIsSignUp(String userID, BuildContext context) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Drivers
      DocumentReference documentRef =
          firestore.collection("Drivers").doc(userID);

      DocumentSnapshot docSnapshot = await documentRef.get();

      //Users
      DocumentReference documentRefUsers =
          firestore.collection("Users").doc(userID);

      DocumentSnapshot docSnapshotUsers = await documentRefUsers.get();

      if (docSnapshot.exists) {
        print("Document exists: ${docSnapshot.data()}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DriverHomePage(),
          ),
        );
      } else if (docSnapshotUsers.exists) {
        print("Document exists: ${docSnapshot.data()}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomePage(),
          ),
        );
      } else {
        print("Document does not exist");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserTypeSelection(),
          ),
        );
      }
    } catch (error) {
      print("Error checking document: $error");
    }
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
