import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phoneNum;
  final DateTime date;

  User({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phoneNum,
    required this.date,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['UserID'].toString(),
      firstName: json['FirstName'].toString(),
      lastName: json['LastName'].toString(),
      email: json['Email'].toString(),
      address: json['Address'].toString(),
      phoneNum: json['PhoneNumber'].toString(),
      date: (json['Registed_Date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserID': userID,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'Address': address,
      'PhoneNumber': phoneNum,
      'Registed_Date': date,
    };
  }
}
