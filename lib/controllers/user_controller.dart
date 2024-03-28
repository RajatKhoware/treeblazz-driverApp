import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tb_driver/data/models/user_model.dart';
import 'package:tb_driver/data/repositories/user_repository.dart';
import 'package:tb_driver/utils/comman/app_snackbar.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          userName: userCredential.user!.displayName ?? "",
          email: userCredential.user!.email ?? "",
          phone: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? "",
        );

        // Store user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      MySnackBar.showWarning(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your Profile.",
      );
    }
  }
}
