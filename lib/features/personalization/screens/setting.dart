import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indoor_air_quality/common/widgets/appbar/appbar.dart';
import 'package:indoor_air_quality/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:indoor_air_quality/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:indoor_air_quality/common/widgets/texts/section_heading.dart';
import 'package:indoor_air_quality/data/repositories/authentication/authentication_repository.dart';
import 'package:indoor_air_quality/utils/constants/colors.dart';
import 'package:indoor_air_quality/utils/constants/sizes.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white))),
                const SizedBox(height: TSizes.spaceBtwSections),

                //   User profile card
                const TUserProfileTile(),
                const SizedBox(height: TSizes.spaceBtwSections)
              ],
            )),

            //   Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //   Account setting
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TSettingMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subtitle: 'Setting any kind of notification'),
                  const TSettingMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account privacy',
                      subtitle: 'Manage data usage and connected accounts'),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'))),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}