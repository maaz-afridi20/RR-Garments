import 'package:coding_with_t_ecommerce2/features/authentications/screens/onboarding/onboarding.dart';
import 'package:coding_with_t_ecommerce2/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodingT E-Commerce',
      themeMode: ThemeMode.system,
      theme: TAppTheme.myLightTheme,
      darkTheme: TAppTheme.myDarkTheme,
      home: const OnboardingScreen(),
    );
  }
}
