import 'package:flutter/foundation.dart';

class OfficerTwoModel {
  String? uid;
  String? email;
  String? password;
  String? name;
  String? phone;
  String? qualification;
  String? panchayath;
  String? department;
  String? dateOfBirth;
  int? status;
  String? role;
  DateTime? createdAt;

  OfficerTwoModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.qualification,
    this.panchayath,
    this.department,
    this.dateOfBirth,
    this.status,
    this.role,
    this.createdAt,
  });

  // Convert User object to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'qualification': qualification,
      'panchayath': panchayath,
      'department': department,
      'dateOfBirth': dateOfBirth,
      'status': status,
      'role': role,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // Convert map to User object
  factory OfficerTwoModel.fromMap(Map<String, dynamic> map) {
    return OfficerTwoModel(
      uid: map['uid'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
      phone: map['phone'],
      qualification: map['qualification'],
      panchayath: map['panchayath'],
      department: map['department'],
      dateOfBirth: map['dateOfBirth'],
      status: map['status'],
      role: map['role'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }
}
