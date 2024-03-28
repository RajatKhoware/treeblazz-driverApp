import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tb_driver/data/exceptions/firebase_exception.dart';
import 'package:tb_driver/data/exceptions/format_exception.dart';
import 'package:tb_driver/data/exceptions/platform_exception_handler.dart';
import 'package:tb_driver/data/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to store user data in Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'Something wen wrong. Please try again';
    }
  }

  // Function to fetch user data based on id,

  // Function to update user data in Firestore.
}
