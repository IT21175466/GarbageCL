import 'package:cloud_firestore/cloud_firestore.dart';

class Garbage {
  final String userID;
  final String garbageID;
  final int plastic;
  final int metal;
  final int glass;
  final int organic;
  final String status;
  final DateTime date;

  Garbage({
    required this.userID,
    required this.garbageID,
    required this.plastic,
    required this.metal,
    required this.glass,
    required this.organic,
    required this.date,
    required this.status,
  });

  factory Garbage.fromJson(Map<String, dynamic> json) {
    return Garbage(
      userID: json['UserID'].toString(),
      garbageID: json['GarbageID'].toString(),
      plastic: int.parse(json['plastic'].toString()),
      metal: int.parse(json['metal'].toString()),
      glass: int.parse(json['glass'].toString()),
      organic: int.parse(json['organic'].toString()),
      date: (json['Registed_Date'] as Timestamp).toDate(),
      status: json['Status'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserID': userID,
      'GarbageID': garbageID,
      'plastic': plastic,
      'metal': metal,
      'glass': glass,
      'organic': organic,
      'Status': status,
      'Registed_Date': date,
    };
  }
}
