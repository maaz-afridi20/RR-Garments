import '../../../../../utils/constants/imported_statement.dart';

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
