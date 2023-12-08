import '../../../../../utils/constants/imported_statement.dart';

class TAppTheme {
  static ThemeData myLightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.myLightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.myLightElevatedButtonTheme,
    appBarTheme: TAppbarTheme.myLightAppbarTheme,
    bottomSheetTheme: TBottomSheeTheme.myLightBottomSheet,
    checkboxTheme: TCheckBoxTheme.myLightCheckBoxTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.myLightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.myLightInputDecorationTheme,
    chipTheme: TChipTheme.myLightChipTheme,
  );
  static ThemeData myDarkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.myDartTextTheme,
      elevatedButtonTheme: TElevatedButtonTheme.myDarkElevatedButtonTheme,
      bottomSheetTheme: TBottomSheeTheme.myDarkBottomSheet,
      checkboxTheme: TCheckBoxTheme.myDarkCheckBoxTheme,
      chipTheme: TChipTheme.myDarkChipTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.myDarkOutlinedButtonTheme,
      inputDecorationTheme: TTextFieldTheme.myDarkInputDecorationTheme,
      appBarTheme: TAppbarTheme.myDarkAppbarTheme);
}
