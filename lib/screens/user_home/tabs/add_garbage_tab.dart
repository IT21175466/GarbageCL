import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/models/garbage.dart';
import 'package:garbagecl/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddGarbageTab extends StatefulWidget {
  const AddGarbageTab({super.key});

  @override
  State<AddGarbageTab> createState() => _AddGarbageTabState();
}

class _AddGarbageTabState extends State<AddGarbageTab> {
  int organic = 0;
  int plastic = 0;
  int metals = 0;
  int glass = 0;

  bool loading = false;

  String? userID = '';
  String? garbageID = '';

  @override
  void initState() {
    super.initState();
    getUserID();
    generateGarbageID();
  }

  getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userID');
    });
  }

  generateGarbageID() {
    setState(() {
      garbageID = Uuid().v4();
    });
  }

  final db = FirebaseFirestore.instance;

  void addGarbageRequest(Garbage garbage, String garbageID,
      BuildContext context, String userID) async {
    setState(() {
      loading = true;
    });

    try {
      db
          .collection("User_Garbages")
          .doc(userID)
          .collection('Garbages')
          .doc(garbageID)
          .set(garbage.toJson());

      db.collection("Garbages").doc(garbageID).set(garbage.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sucessfully Added"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 144,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(204, 247, 233, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    Icons.camera_alt,
                    size: 50,
                  ),
                  Text(
                    "SCAN",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Text(
            "Cannot identify Category? Try Scan.",
            style: TextStyle(
              color: const Color.fromARGB(255, 60, 142, 94),
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: 30,
          ),
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
                      if (organic >= 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        organic = organic + 1;
                      }
                    });
                  },
                  child: SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),
                ),

                SizedBox(width: 10),

                Text(
                  "$organic",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (organic < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        organic = organic - 1;
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
                      if (plastic >= 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        plastic = plastic + 1;
                      }
                    });
                  },
                  child: SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),
                ),

                SizedBox(width: 10),

                Text(
                  "$plastic",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (plastic < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        plastic = plastic - 1;
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
                      if (metals >= 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        metals = metals + 1;
                      }
                    });
                  },
                  child: SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),
                ),

                SizedBox(width: 10),

                Text(
                  "$metals",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (metals < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        metals = metals - 1;
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
                      if (glass >= 10) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        glass = glass + 1;
                      }
                    });
                  },
                  child: SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),
                ),

                SizedBox(width: 10),

                Text(
                  "$glass",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (glass < 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter vaild quantity!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        glass = glass - 1;
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
              try {
                setState(() {
                  loading = true;
                });

                Garbage garbage = Garbage(
                  userID: userID!,
                  garbageID: garbageID!,
                  plastic: plastic,
                  metal: metals,
                  glass: glass,
                  organic: organic,
                  date: DateTime.now(),
                  status: 'Pending',
                );

                addGarbageRequest(garbage, garbageID!, context, userID!);
              } catch (e) {
                print(e);
              } finally {
                setState(() {
                  plastic = 0;
                  organic = 0;
                  metals = 0;
                  glass = 0;
                });
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
                    text: "ADD",
                    height: 50,
                    width: screenWidth,
                    backgroundColor: Colors.green,
                  ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
