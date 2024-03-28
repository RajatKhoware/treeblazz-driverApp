import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tb_driver/data/exceptions/firebase_auth_exception.dart';
import 'package:tb_driver/data/exceptions/firebase_exception.dart';
import 'package:tb_driver/data/exceptions/format_exception.dart';
import 'package:tb_driver/data/exceptions/platform_exception_handler.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/signin_screen.dart';
import 'package:tb_driver/fetaures/dynamic/auth/screen/verify_email_screen.dart';
import 'package:tb_driver/fetaures/static/navigation%20menu/view/app_navigation_menu.dart';
import 'package:tb_driver/fetaures/static/onboarding/view/screen/on_boarding_screen.dart';
import 'package:tb_driver/fetaures/static/splash/screens/splash_screen.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart  on app launch
  @override
  void onReady() {
    // Redirect to the appropriate screen
    SplashScreen.startTimer();
    super.onReady();
  }

  // Function to share the Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the user's email is verified, navigate to the Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      // Check if it's the first time launching the app
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const SignInScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  /*----------------------- Email & Password sign-in -------------------------------*/

  // [Email Authentication] - signIn
  Future<UserCredential> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  // [Email Authentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  // [ReAuthentication] - ReAuthenticate User
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  // [Email Verification] - MAIL VERIFICATION

  // [Email Authentication] - FORGET PASSWORD

  /*----------------------- Socail sign-in ------------------------------------------------*/

  // [Google Authentication] - GOOGLE
  Future<UserCredential?> signInWIthGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details form the request
      final GoogleSignInAuthentication? googleAccount =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAccount?.accessToken,
          idToken: googleAccount?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  // [Facebook Authentication] - FACEBOOK

  /*------------------------ END sign-in ---------------------------------------------------*/

  // [LogoutUser] - valid for any authentication.
  Future<void> logout() async {
    try {
      // await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const SignInScreen());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatExceptionHandler();
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw 'An unknown error occurred: $e';
    }
  }

  // [Delete User] - Remove user auth & Firebase account.
}
