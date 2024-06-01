import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/data/repositories/authentication/authentication_repository.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import 'package:indoor_air_quality/utils/popups/full_screen_loader.dart';
import 'package:indoor_air_quality/utils/popups/loader.dart';
import '../../../../utils/helpers/network_manager.dart';

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
      if (!isConnected) return;

      //   Form validation
      if (!signupFormKey.currentState!.validate()) return;

      //   Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the privacy & terms of use');
        return;
      }
      // Register user in the Firebase Authentication & save user data in the Firebase
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
