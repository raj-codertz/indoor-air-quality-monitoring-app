import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/common/styles/spacing_styles.dart';
import 'package:indoor_air_quality/features/authentication/screens/login/widgets/login_form.dart';
import 'package:indoor_air_quality/features/authentication/screens/login/widgets/login_header.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import 'package:indoor_air_quality/utils/constants/text_strings.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            //   Login title & subtitle
            const TLoginHeader(),
            const TLoginForm(),

            // Divider
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            //   Footer
            const TSocialButtons()
          ],
        ),
      ),
    ));
  }
}