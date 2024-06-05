import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/data/repositories/user/user_repository.dart';
import 'package:indoor_air_quality/features/personalization/models/user_model.dart';
import 'package:indoor_air_quality/utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

//   save user record from any registration provider
Future<void> saveUserRecord(UserCredential? userCredentials) async {
  try {
    if (userCredentials != null) {
    //   convert name to first and last name
      final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '' );

    //   Map Data
      final user = UserModel(
        id: userCredentials.user!.uid,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
        email: userCredentials.user!.email ?? '',
        phoneNumber: userCredentials.user!.phoneNumber ?? '',
        profilePicture: userCredentials.user!.photoURL ?? '',
        registrationNumber: '',
        roomNumber: ''
      );

    //   Save user data
      await userRepository.saveUserRecord(user);
    }
  } catch (e) {
    TLoaders.warningSnackBar(
      title: 'Data not saved',
      message: 'Something went wrong while saving your information. You can re-save your data in profile'
    );
  }
}
}