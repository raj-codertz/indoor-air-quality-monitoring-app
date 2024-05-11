import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.appBarHeight,
      right: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace,
      left: TSizes.defaultSpace
  );
}