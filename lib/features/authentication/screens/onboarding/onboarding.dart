import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:indoor_air_quality/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:indoor_air_quality/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:indoor_air_quality/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:indoor_air_quality/utils/constants/image_strings.dart';
import 'package:indoor_air_quality/utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //   Horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.dust,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.temperature,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.humidity,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              OnboardingPage(
                image: TImages.smoke,
                title: TTexts.onBoardingTitle4,
                subTitle: TTexts.onBoardingSubTitle4,
              )
            ],
          ),

          //   Skip Button
          const OnboardingSkip(),

          //   Dot indicator
          const OnboardingDotNavigation(),

          //   Circular Button
          const OnboardingNextButton()
        ],
      ),
    );
  }
}
