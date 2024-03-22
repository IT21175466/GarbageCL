import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/screens/splash_screen/loading_splash.dart';
import 'package:garbagecl/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  final String verificationID;
  const OTPScreen(
      {super.key, required this.mobileNumber, required this.verificationID});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  bool loading = false;

  String userId = '';

  //Get OTP Code
  getOTPCode(String vID, String otp, BuildContext context) async {
    try {
      PhoneAuthCredential credential =
          await PhoneAuthProvider.credential(verificationId: vID, smsCode: otp);

      FirebaseAuth.instance.signInWithCredential(credential).then(
        (UserCredential userCredential) async {
          userId = await userCredential.user!.uid;
          print("User ID: $userId");
          setUserID(userId);

          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('logedIn', true);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoadingSplash(
                id: userId,
              ),
            ),
          );
          setState(() {
            loading = false;
          });
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        loading = false;
      });
    }
  }

  //Save UserID
  Future<void> setUserID(String uID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', uID);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Phone Verification',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "We have send an OTP to your number",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.mobileNumber,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Pinput(
              controller: otpController,
              length: 6,
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (otpController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter OTP"),
                    ),
                  );
                } else {
                  setState(() {
                    loading = true;
                  });

                  getOTPCode(
                      widget.verificationID, otpController.text, context);
                }
              },
              child: loading
                  ? Container(
                      height: 50,
                      width: screenWidth,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : CustomButton(
                      text: 'Verify',
                      height: 50,
                      width: screenWidth,
                      backgroundColor: Colors.green,
                    ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            SizedBox(
              height: 30,
              //width: 50,
              child: Image.asset('assets/images/garbagecl_green.png'),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
