import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/screens/authentication/otp_screen.dart';
import 'package:garbagecl/widgets/custom_button.dart';
import 'package:garbagecl/widgets/phone_textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  bool loading = false;

  String selectedDate = '';
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  selectCountry(BuildContext context) async {
    final countryC = await countryPicker.showPicker(
      pickerMinHeight: 30,
      context: context,
    );

    setState(() {
      countryCode = countryC;
    });
  }

  verifyPhoneNumber(String phone, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException ex) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ex.message.toString()),
            ),
          );
          print(ex.message.toString());
          setState(() {
            loading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(
                mobileNumber: (countryCode?.dialCode ?? '') +
                    (' ') +
                    phoneController.text,
                verificationID: verificationId,
              ),
            ),
          );

          setState(() {
            loading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: countryCode!.dialCode + phone,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: const Color.fromARGB(255, 234, 243, 250),
        child: Column(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            SizedBox(
              //height: 150,
              width: 200,
              child: Image.asset('assets/images/garbagecl_green.png'),
            ),
            Spacer(),
            SizedBox(
              height: 200,
              //width: 150,
              child: Image.asset('assets/images/phone_hand.png'),
            ),
            Spacer(),
            Text(
              'Enter Your Mobile Number',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We'll send you a verification code.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PhoneTextField(
              controller: phoneController,
              labelText: 'Phone Number',
              hintText: "71XXXXXXX",
              prefix: GestureDetector(
                onTap: () async {
                  selectCountry(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    countryCode == null
                        ? '+1'
                        : '${countryCode?.dialCode ?? '+1'}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter your Phone Number"),
                    ),
                  );
                } else {
                  setState(() {
                    loading = true;
                  });

                  verifyPhoneNumber(phoneController.text, context);
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
                      text: 'Next',
                      height: 50,
                      width: screenWidth,
                      backgroundColor: Colors.green,
                    ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
