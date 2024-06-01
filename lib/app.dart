import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:indoor_air_quality/bindings/general_bindings.dart';
import 'package:indoor_air_quality/features/authentication/screens/login/login.dart';
import 'package:indoor_air_quality/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}