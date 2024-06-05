import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:indoor_air_quality/data/repositories/authentication/authentication_repository.dart';
import 'package:indoor_air_quality/features/personalization/controllers/user_controller.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import 'package:indoor_air_quality/utils/helpers/network_manager.dart';
import 'package:indoor_air_quality/utils/popups/full_screen_loader.dart';
import 'package:indoor_air_quality/utils/popups/loader.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //   Email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //   start loader
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.decorAnimation);

      //   Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //   Login user using email & password authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //   Remove loader
      TFullScreenLoader.stopLoading();

      //   Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

//   Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', TImages.decorAnimation);

      //   Checkout internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //   Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //   save user record
      await userController.saveUserRecord(userCredentials);

      //   Remove loader
      TFullScreenLoader.stopLoading();

    //   Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
