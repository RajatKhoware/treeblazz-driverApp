import 'package:tb_driver/utils/constant/enum.dart';

class AppText {
  static const String productDesc =
      "Introducing GreenGrove Herbal Bliss, the premium choice for your cannabis experience.";

  // -- Authentication Headings
  static const String loginTitle = "Welcome back,";
  static const String loginSubTitle =
      "Discover Limitless Choices and Unmatched Convenience.";
  static const String signupTitle = "Let’s create your account";
  static const String forgetPasswordTitle = "Forget password";
  static const String forgetPasswordSubTitle =
      "Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.";
  static const String changeYourPasswordTitle = "Password Reset Email Sent";
  static const String changeYourPasswordSubTitle =
      "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.";
  static const String confirmEmail = "Verify your email address!";
  static const String confirmEmailSubTitle =
      "Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.";
  static const String emailNotReceivedMessage =
      "Didn’t get the email? Check your junk/spam or resend it.";
  static const String yourAccountCreatedTitle =
      "Your account successfully created!";
  static const String yourAccountCreatedSubTitle =
      "Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!";

  static Map<OrderStatus, String> statusTexts = {
    // OrderStatus.placed: "Order Placed",
    // OrderStatus.accept: "Order Accepted",
    // OrderStatus.cancelled: "Order Cancelled",
    // OrderStatus.preparing: "Order Processing",
    OrderStatus.readyForPickup: "New Order",
    OrderStatus.pickedUpByDriver: "Picked Up From Seller",
    OrderStatus.outForDelivery: "Out for Delivery",
    OrderStatus.delivered: "Order Delivered",
  };
}
