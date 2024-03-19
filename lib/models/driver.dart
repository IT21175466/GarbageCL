import 'package:cloud_firestore/cloud_firestore.dart';

class Driver {
  final String userID;
  final String firstName;
  final String lastName;
  final String email;
  final String vehicleType;
  final String vehicleNumber;
  final String phoneNum;
  final String nic;
  final DateTime date;

  Driver({
    required this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nic,
    required this.phoneNum,
    required this.date,
    required this.vehicleType,
    required this.vehicleNumber,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      userID: json['UserID'].toString(),
      firstName: json['FirstName'].toString(),
      lastName: json['LastName'].toString(),
      email: json['Email'].toString(),
      phoneNum: json['PhoneNumber'].toString(),
      date: (json['Registed_Date'] as Timestamp).toDate(),
      nic: json['NIC'].toString(),
      vehicleType: json['VehicleType'].toString(),
      vehicleNumber: json['VehicleNumber'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserID': userID,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNum,
      'Registed_Date': date,
      'VehicleType': vehicleType,
      'VehicleNumber': vehicleNumber,
      'NIC': nic,
    };
  }
}
