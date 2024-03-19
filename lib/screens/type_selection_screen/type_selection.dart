import 'package:flutter/material.dart';
import 'package:garbagecl/screens/authentication/driver_signup_screen.dart';
import 'package:garbagecl/screens/authentication/signup_screen.dart';

class UserTypeSelection extends StatefulWidget {
  const UserTypeSelection({super.key});

  @override
  State<UserTypeSelection> createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection> {
  bool isDriver = false;
  bool isUser = false;

  changeUserType(BuildContext context) {
    if (isDriver == true) {
      print('Navigate to Driver Sign up');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DriverSignUpScreen(),
        ),
      );

      //Navigate to Driver Sign up
    } else if (isUser == true) {
      print('Navigate to user');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUPScreen(),
        ),
      );
      //Navigate to user
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Role',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: screenWidth,
        child: Column(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDriver = true;
                  isUser = false;
                });

                changeUserType(context);
              },
              child: Container(
                height: 250,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: isDriver ? Colors.blueAccent : Colors.green,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Image.asset('assets/images/driver.png'),
                      ),
                    ),
                    Text(
                      'Driver',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Join as a Driver',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                setState(() {
                  isUser = true;
                  isDriver = false;
                });

                changeUserType(context);
              },
              child: Container(
                height: 250,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: isUser ? Colors.blueAccent : Colors.green,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Image.asset('assets/images/passenger.png'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Join as a User',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
