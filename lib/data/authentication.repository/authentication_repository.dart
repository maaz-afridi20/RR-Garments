import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  // called from main.dart class when app launched

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    // fetching local device storage variable
    deviceStorage.writeIfNull('isFirstTime',
        true); // this function will only be called only when the first time user is  null mean that there is no user first time

//
//
// so this will check that if the user has first time then
// this will show the onboarding screen while if the user is not first time then
// it will show the onboarding screen
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

// Function to show that screen what we want to display

  screenRedirect() async {}
}
