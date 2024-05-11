import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indoor_air_quality/features/authentication/screens/signup/verify_email.dart';
import 'package:indoor_air_quality/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user))),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.registrationNumber,
                prefixIcon: Icon(Iconsax.user_edit))),
        //   Room Number
        TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.roomNumber, prefixIcon: Icon(Iconsax.home))),
        // Email
        TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),
        // Phone number
        TextFormField(
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
        // Password
        TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash))),
        const SizedBox(height: TSizes.spaceBtwSections),

        //   Terms & conditions checkbox
        const TTermsAndConditionsCheckbox(),
        const SizedBox(height: TSizes.spaceBtwSections),
        //   Sign up button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(TTexts.createAccount),
          ),
        )
      ],
    ));
  }
}
