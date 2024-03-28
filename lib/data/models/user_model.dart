import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String userName;
  final String email;
  final String phone;
  final String profilePicture;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.profilePicture,
  });

  // Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(' ');

  // static function to create an empty user model
  static UserModel empty() => UserModel(
        id: '',
        userName: '',
        email: '',
        phone: '',
        profilePicture: '',
      );

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
    };
  }
}
