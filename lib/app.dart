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
      initialBinding: GeneralBindings(),

      // this will show the progress indicator and will check that which
      // screen should to show.
      home: const Scaffold(
        backgroundColor: TColors.basicPprimaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
