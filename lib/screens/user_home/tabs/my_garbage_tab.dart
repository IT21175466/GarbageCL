import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagecl/providers/user_provider.dart';
import 'package:garbagecl/screens/user_home/update_garbage.dart';
import 'package:provider/provider.dart';

class MyGarbageTab extends StatefulWidget {
  const MyGarbageTab({super.key});

  @override
  State<MyGarbageTab> createState() => _MyGarbageTabState();
}

class _MyGarbageTabState extends State<MyGarbageTab> {
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getUserID();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final db = FirebaseFirestore.instance;
    return Consumer(
      builder:
          (BuildContext context, UserProvider userProvider, Widget? child) =>
              StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User_Garbages')
            .doc(userProvider.userID)
            .collection("Garbages")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Connection Error!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            Text(
              'Loading.....',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            );
          }

          if (snapshot.hasData) {
            var docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 232, 232),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Garbage Info',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            // Text(
                            //   'TUK',
                            //   style: TextStyle(
                            //     fontFamily: 'Poppins',
                            //     fontWeight: FontWeight.w600,
                            //     color: Colors.black,
                            //     fontSize: 12,
                            //   ),
                            // ),
                          ],
                        ),
                        Text(
                          'Garbage ID ${docs[index]['GarbageID'].toString()}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Plastic',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              docs[index]['plastic'].toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Metal',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              docs[index]['metal'].toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Glass',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              docs[index]['glass'].toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Organic',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              docs[index]['organic'].toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'PENDING',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateGarbage(
                                      plastic: docs[index]['plastic'],
                                      metal: docs[index]['metal'],
                                      glass: docs[index]['glass'],
                                      organic: docs[index]['organic'],
                                      status: docs[index]['Status'].toString(),
                                      garbageiD:
                                          docs[index]['GarbageID'].toString(),
                                      useriD: docs[index]['UserID'].toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Icon(Icons.edit),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Comfirm Your Delete"),
                                    content:
                                        const Text("Do you want to delete?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          try {
                                            db
                                                .collection("User_Garbages")
                                                .doc(docs[index]['UserID']
                                                    .toString())
                                                .collection('Garbages')
                                                .doc(docs[index]['GarbageID']
                                                    .toString())
                                                .delete();

                                            db
                                                .collection("Garbages")
                                                .doc(docs[index]['GarbageID']
                                                    .toString())
                                                .delete();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text("Sucessfully Deleted"),
                                              ),
                                            );
                                          } catch (e) {
                                            print(e);
                                          } finally {
                                            Navigator.of(ctx).pop();
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text(
                                            "Yes",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("No"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
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
                  );
                  // QuizHistoryCard(
                  //   title: docs[index]['QuizName'],
                  //   marks: docs[index]['Marks'],
                  //   didDate: docs[index]['Date'],
                  //   id: docs[index]['StudentID'],
                  // );
                });
          }
          return Text(
            'No Docs',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          );
        },
      ),
    );
    // return Column(
    //   children: [
    //     Container(
    //       width: screenWidth,
    //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //       decoration: BoxDecoration(
    //         color: const Color.fromARGB(255, 251, 232, 232),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               Text(
    //                 'Garbage Info',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 20,
    //                 ),
    //               ),
    //               Spacer(),
    //               Text(
    //                 'TUK',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Text(
    //             'Garbage ID - WTRF34552VSFGA2',
    //             style: TextStyle(
    //               fontFamily: 'Poppins',
    //               fontWeight: FontWeight.w400,
    //               color: Colors.grey,
    //               fontSize: 12,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Plastic',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Spacer(),
    //               Text(
    //                 '23',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Metal',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Spacer(),
    //               Text(
    //                 '8',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Glass',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Spacer(),
    //               Text(
    //                 '1',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Organic',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Spacer(),
    //               Text(
    //                 '4',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w600,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'PENDING',
    //                 style: TextStyle(
    //                   fontFamily: 'Poppins',
    //                   fontWeight: FontWeight.w700,
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Spacer(),
    //               Icon(Icons.edit),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Icon(
    //                 Icons.delete,
    //                 color: Colors.red,
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
