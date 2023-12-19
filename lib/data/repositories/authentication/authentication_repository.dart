import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart class when app launched

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
// Function to show that screen what we want to display

  screenRedirect() async {
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

  // -----------------------------EMAIL AND PASSWORD SIGN IN-----------------------------------

  // [EMAIL AUTHENTICATION]    sign in

  //  REGISTER..
  Future<UserCredential> registerWitheEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
