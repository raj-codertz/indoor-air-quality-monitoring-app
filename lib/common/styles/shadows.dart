import 'package:flutter/material.dart';
import 'package:indoor_air_quality/utils/constants/colors.dart';

class TShadowStyle {
   static final airParametersShadow = BoxShadow(
     color:  TColors.darkGrey.withOpacity(0.1),
     blurRadius: 50,
     spreadRadius: 7,
     offset: const Offset(0, 2)
   );
}