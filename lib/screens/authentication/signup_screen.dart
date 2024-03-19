import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/models/user.dart';
import 'package:garbagecl/screens/user_home/user_home_page.dart';
import 'package:garbagecl/widgets/custom_button.dart';
import 'package:garbagecl/widgets/custom_textfild.dart';
import 'package:garbagecl/widgets/phone_textfiled.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool loading = false;

  String? userID = '';

  final db = FirebaseFirestore.instance;

  getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userID');
    });
  }

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

  //Add User to firestore
  addUserToFirebase(User user, BuildContext context, String uID) async {
    try {
      db.collection("Users").doc(uID).set(user.toJson()).then((value) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('logedIn', true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User Registration Success!"),
          ),
        );

        setState(() {
          loading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserHomePage(),
          ),
        );
      });
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

  @override
  void initState() {
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign UP',
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
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 20),
              //   child: SizedBox(
              //     height: 60,
              //     width: 60,
              //     child: Image.asset('assets/images/gPhotosLogo.png'),
              //   ),
              // ),
              CustomTextField(
                  controller: firstNameController, labelText: 'First Name'),
              CustomTextField(
                  controller: lastNameController, labelText: 'Last Name'),
              CustomTextField(controller: emailController, labelText: 'Email'),
              CustomTextField(
                  controller: addressController, labelText: 'Address'),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
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
                height: 35,
              ),
              GestureDetector(
                onTap: () async {
                  if (firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      addressController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      countryCode?.name == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Please enter all required details correctly!",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // userProvider.userID =
                    //     userProvider.generateRandomId().toString();

                    String phoneNo =
                        "${countryCode?.dialCode}" + phoneController.text;
                    setState(() {
                      loading = true;
                    });

                    final addUser = User(
                      userID: userID!,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      address: addressController.text,
                      phoneNum: phoneNo,
                      date: DateTime.now(),
                    );

                    addUserToFirebase(addUser, context, userID!);
                  }
                },
                child: CustomButton(
                  text: 'Continue',
                  height: 50,
                  width: screenWidth,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
