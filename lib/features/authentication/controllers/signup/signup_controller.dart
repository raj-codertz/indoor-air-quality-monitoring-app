import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/data/repositories/authentication/authentication_repository.dart';
import 'package:indoor_air_quality/data/repositories/user/user_repository.dart';
import 'package:indoor_air_quality/features/authentication/screens/signup/verify_email.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import 'package:indoor_air_quality/utils/popups/full_screen_loader.dart';
import 'package:indoor_air_quality/utils/popups/loader.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//   Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final roomNumber = TextEditingController();
  final registrationNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

// Signup
  void signup() async {
    try {
      //   Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.decorAnimation);

      //   Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Form validation
      if (!signupFormKey.currentState!.validate()) {
        //  Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the privacy & terms of use');
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //   Save authenticated user data in the firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          registrationNumber: registrationNumber.text.trim(),
          roomNumber: roomNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      TFullScreenLoader.stopLoading();

      //   show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your account has been created');
      //   Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
