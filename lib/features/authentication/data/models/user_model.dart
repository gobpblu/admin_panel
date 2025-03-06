import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/utils/formatters/date_formatter.dart';
import 'package:ecommerce_admin_panel/utils/formatters/phone_formatter.dart';

import 'app_role.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    required this.email,
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
  });

  String get fullName => '$firstName $lastName';
  String get formattedDate => DateFormatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => DateFormatter.formatDate(updatedAt);
  String get formattedPhoneNo => PhoneFormatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(email: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role.name,
      'CreatedAt': createdAt,
      'UpdatedAt': updatedAt = DateTime.now(),
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return empty();
    }
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
      lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
      username: data.containsKey('Username') ? data['Username'] ?? '' : '',
      email: data.containsKey('Email') ? data['Email'] ?? '' : '',
      phoneNumber: data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
      profilePicture: data.containsKey('ProfilePicture') ? data['ProfilePicture'] ?? '' : '',
      role: data.containsKey('Role')
          ? AppRole.values.firstWhere((element) => element.name == data['Role'], orElse: () => AppRole.user)
          : AppRole.user,
      createdAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      updatedAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
    );
  }
}
