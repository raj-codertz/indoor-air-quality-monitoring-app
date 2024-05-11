import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/common/widgets/login_signup/form_divider.dart';
import 'package:indoor_air_quality/common/widgets/login_signup/social_buttons.dart';
import 'package:indoor_air_quality/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import 'package:indoor_air_quality/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              //   Form
              const TSignupForm(),
              // Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),
            //  Social buttons
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}