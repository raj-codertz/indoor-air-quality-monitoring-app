import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text('rajabu j shabani',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.white)),
      subtitle: Text('rajabujshabani@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      trailing: IconButton(
          onPressed: () {}, icon: const Icon(Icons.edit, color: TColors.white)),
    );
  }
}