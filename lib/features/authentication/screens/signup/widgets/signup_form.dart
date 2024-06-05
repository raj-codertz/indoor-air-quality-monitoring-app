import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indoor_air_quality/features/authentication/controllers/signup/signup_controller.dart';
import 'package:indoor_air_quality/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:indoor_air_quality/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      validator: (value) =>
                          TValidator.validateEmptyText('First Name', value),
                      controller: controller.firstName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user))),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                      validator: (value) =>
                          TValidator.validateEmptyText('Last Name', value),
                      controller: controller.lastName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user))),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //   Registration number
            TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyText('Registration Number', value),
                controller: controller.registrationNumber,
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.registrationNumber,
                    prefixIcon: Icon(Iconsax.user_edit))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //   Room Number
            TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyText('Room Number', value),
                controller: controller.roomNumber,
                decoration: const InputDecoration(
                    labelText: TTexts.roomNumber,
                    prefixIcon: Icon(Iconsax.home))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Email
            TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                    labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Phone number
            TextFormField(
                validator: (value) => TValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: const InputDecoration(
                    labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // Password
            Obx(
              () => TextFormField(
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)))),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //   Terms & conditions checkbox
            const TTermsAndConditionsCheckbox(),
            const SizedBox(height: TSizes.spaceBtwSections),
            //   Sign up button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount),
              ),
            )
          ],
        ));
  }
}
