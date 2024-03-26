import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/providers/user_provider.dart';
import 'package:garbagecl/widgets/custom_textfild.dart';
import 'package:garbagecl/widgets/user_info_card.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String imageUrl = '';

  var userProvider = UserProvider();

  bool loading = false;
  bool uploaded = false;
  bool bioAdded = false;

  File? backImage;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getUserID();
    userProvider.getUserData(context);
  }

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    TextEditingController bioController = TextEditingController();

    return Consumer(
      builder:
          (BuildContext context, UserProvider userProvider, Widget? child) =>
              Column(
        children: [
          UserInfoCard(hint: "First Name", detail: userProvider.firstName),
          UserInfoCard(hint: "Last Name", detail: userProvider.lastName),
          UserInfoCard(hint: "Email", detail: userProvider.email),
          UserInfoCard(hint: "Phone Number", detail: userProvider.phoneNum),
          UserInfoCard(hint: "NIC", detail: userProvider.nic),
          userProvider.bio == ''
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Optional Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            userProvider.bio,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              //Update
                              setState(() {
                                bioController.text = userProvider.bio;
                              });
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Add Another Number"),
                                  content: CustomTextField(
                                      controller: bioController,
                                      labelText: 'Add a Number'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        if (bioController.text.isEmpty) {
                                          Navigator.of(ctx).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text("Please Enter a Number"),
                                            ),
                                          );
                                        } else {
                                          if (bioController.text.length < 10) {
                                            Navigator.of(ctx).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Please Enter a Valid Number"),
                                              ),
                                            );
                                          } else {
                                            try {
                                              db
                                                  .collection("Numbers")
                                                  .doc(userProvider.userID)
                                                  .update({
                                                'number': bioController.text,
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text("Sucessfully Added"),
                                                ),
                                              );
                                              setState(() {
                                                bioAdded = true;
                                              });
                                            } catch (e) {
                                              print(e);
                                            } finally {
                                              Navigator.of(ctx).pop();
                                              userProvider.getUserData(context);
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Text(
                                          "Update",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("Cancel"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(Icons.edit),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await db
                                  .collection("Numbers")
                                  .doc(userProvider.userID)
                                  .delete();
                              setState(() {
                                userProvider.bio = '';
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          userProvider.bio == ''
              ? GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Add Another Number"),
                        content: CustomTextField(
                            controller: bioController,
                            labelText: 'Add a Number'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              if (bioController.text.isEmpty) {
                                Navigator.of(ctx).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please Enter a Number"),
                                  ),
                                );
                              } else {
                                try {
                                  db
                                      .collection("Numbers")
                                      .doc(userProvider.userID)
                                      .set({
                                    'number': bioController.text,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Sucessfully Added"),
                                    ),
                                  );
                                  setState(() {
                                    bioAdded = true;
                                  });
                                } catch (e) {
                                  print(e);
                                } finally {
                                  Navigator.of(ctx).pop();
                                  userProvider.getUserData(context);
                                }
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text(
                                "ADD",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: const Text("Cancel"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 221, 221),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Add Number',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
