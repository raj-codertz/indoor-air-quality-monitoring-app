import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//   variables
final deviceStorage = GetStorage();
final _auth = FirebaseAuth.instance;


// Email & Password
Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } catch(e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FormatException catch(_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}
}