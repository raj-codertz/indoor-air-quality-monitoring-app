import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel {
//   keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  final String roomNumber;
  final String registrationNumber;
  String profilePicture;

// Constructor for UserModel;
  UserModel({
    required this.id,
    required this.firstName,
    required this.roomNumber,
    required this.registrationNumber,
    required this.phoneNumber,
    required this.email,
    required this.lastName,
    required this.profilePicture,
  });

// Helper function to get the full name
  String get fullName => '$firstName $lastName';

// Helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

// Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

//   static function to create an empty user model
  static UserModel empty() =>
      UserModel(id: '',
          firstName: '',
          roomNumber: '',
          registrationNumber: '',
          phoneNumber: '',
          email: '',
          lastName: '',
          profilePicture: '');

//   convert model to JSON structure for storing data in Firestore
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'lastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'roomNumber': roomNumber,
      'registrationNumber': registrationNumber
    };
  }

// Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ??'',
          roomNumber: data['roomNumber'] ?? '',
          registrationNumber: data['registrationNumber'] ?? '',
          phoneNumber: data['phoneNumber'] ?? '',
          email: data['email'] ?? '',
          lastName: data['lastName'] ?? '',
          profilePicture: data['profilePicture'] ?? '');
    } throw '';
  }
}
