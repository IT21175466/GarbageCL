import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String? userID = '';

  String firstName = '...';
  String lastName = '...';
  String email = '...';
  String nic = '...';
  String phoneNum = '...';
  String bio = '';
  String registedDate = '...';

  void getUserData(BuildContext context) async {
    try {
      await getUserID();

      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userID)
          .get();

      final DocumentSnapshot userBioDoc = await FirebaseFirestore.instance
          .collection("Numbers")
          .doc(userID)
          .get();

      if (userBioDoc.exists) {
        bio = userBioDoc.get('number');
        notifyListeners();
      }

      firstName = userDoc.get('FirstName');
      lastName = userDoc.get('LastName');
      email = userDoc.get('Email');
      nic = userDoc.get('NIC');
      phoneNum = userDoc.get('PhoneNumber');
      registedDate = userDoc.get('Registed_Date').toString();

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('userID');
    notifyListeners();
  }
}
