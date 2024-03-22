import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/models/garbage.dart';
import 'package:garbagecl/widgets/custom_button.dart';

class UpdateGarbage extends StatefulWidget {
  final int plastic;
  final int metal;
  final int glass;
  final int organic;
  final String status;
  final String garbageiD;
  final String useriD;
  const UpdateGarbage(
      {super.key,
      required this.plastic,
      required this.metal,
      required this.glass,
      required this.organic,
      required this.status,
      required this.garbageiD,
      required this.useriD});

  @override
  State<UpdateGarbage> createState() => _UpdateGarbageState();
}

class _UpdateGarbageState extends State<UpdateGarbage> {
  int plasticA = 0;
  int metalA = 0;
  int glassA = 0;
  int organicA = 0;
  String? statusA;
  String? garbageiDA;

  @override
  void initState() {
    super.initState();
    setState(() {
      plasticA = widget.plastic;
      metalA = widget.metal;
      glassA = widget.glass;
      organicA = widget.organic;
      statusA = widget.status;
      garbageiDA = widget.garbageiD;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final db = FirebaseFirestore.instance;

    void updateGarbageRequest(Garbage garbage, String garbageID,
        BuildContext context, String userID) async {
      setState(() {
        //loading = true;
      });

      try {
        db
            .collection("User_Garbages")
            .doc(userID)
            .collection('Garbages')
            .doc(garbageID)
            .update(garbage.toJson());

        db.collection("Garbages").doc(garbageID).update(garbage.toJson());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Sucessfully Updated"),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      } finally {
        Navigator.pop(context);
        setState(() {
          //loading = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Update',
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
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 98, 98, 97),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Organic",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (organicA >= 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          organicA = organicA + 1;
                        }
                      });
                    },
                    child: SizedBox(
                        height: 20,
                        child: Image.asset('assets/images/plus.png')),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "$organicA",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (organicA < 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          organicA = organicA - 1;
                        }
                      });
                    },
                    child: Image.asset(
                      'assets/images/minus.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Plastic",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (plasticA >= 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          plasticA = plasticA + 1;
                        }
                      });
                    },
                    child: SizedBox(
                        height: 20,
                        child: Image.asset('assets/images/plus.png')),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "$plasticA",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (plasticA < 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          plasticA = plasticA - 1;
                        }
                      });
                    },
                    child: Image.asset(
                      'assets/images/minus.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Metals",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (metalA >= 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          metalA = metalA + 1;
                        }
                      });
                    },
                    child: SizedBox(
                        height: 20,
                        child: Image.asset('assets/images/plus.png')),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "$metalA",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (metalA < 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          metalA = metalA - 1;
                        }
                      });
                    },
                    child: Image.asset(
                      'assets/images/minus.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Glass",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (glassA >= 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          glassA = glassA + 1;
                        }
                      });
                    },
                    child: SizedBox(
                        height: 20,
                        child: Image.asset('assets/images/plus.png')),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "$glassA",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (glassA < 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter vaild quantity!'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          glassA = glassA - 1;
                        }
                      });
                    },
                    child: Image.asset(
                      'assets/images/minus.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Garbage garbage = Garbage(
                  userID: widget.useriD,
                  garbageID: widget.garbageiD,
                  plastic: plasticA,
                  metal: metalA,
                  glass: glassA,
                  organic: organicA,
                  date: DateTime.now(),
                  status: widget.status,
                );

                updateGarbageRequest(
                    garbage, widget.garbageiD, context, widget.useriD);
              },
              child: CustomButton(
                text: "UPDATE",
                height: 50,
                width: screenWidth,
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
