import 'package:flutter/material.dart';

class TBottomSheeTheme {
  TBottomSheeTheme._();

  // light bottom sheet theme
  static BottomSheetThemeData myLightBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  // dart bottom sheet theme
  static BottomSheetThemeData myDarkBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
