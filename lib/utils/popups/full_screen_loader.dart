import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indoor_air_quality/common/widgets/loaders/animation_loader.dart';
import 'package:indoor_air_quality/utils/constants/colors.dart';
import 'package:indoor_air_quality/utils/helpers/helper_functions.dart';

class TFullScreenLoader {

    static openLoadingDialog(String text, String animation) {
      showDialog(
          context: Get.overlayContext!,
          barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
          builder: (_) => PopScope(
            canPop: false, // Disable popping with the back button
              child: Container(
                color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 250),
                    TAnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              )
          )
      );
    }

    static stopLoading() {
      Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the navigator
    }
}