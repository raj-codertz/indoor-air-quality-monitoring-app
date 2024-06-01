import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import 'package:indoor_air_quality/utils/popups/full_screen_loader.dart';
import 'package:indoor_air_quality/utils/popups/loader.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//   Variables
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final roomNumber = TextEditingController();
  final registrationNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

// Signup
  Future<void> signup() async {
    try {
      //   Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.decorAnimation);

      //   Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
