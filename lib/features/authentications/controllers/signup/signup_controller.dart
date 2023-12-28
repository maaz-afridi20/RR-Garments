import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class SignUpControler extends GetxController {
  static SignUpControler get instance => Get.find();

  // variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final emailC = TextEditingController();
  final firstnameC = TextEditingController();
  final lastnameC = TextEditingController();
  final usernameC = TextEditingController();
  final phonenumberC = TextEditingController();
  final passwordC = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  //signup

  Future<void> signUp() async {
    try {
      //! start loading

      TFullScreenLoader.openLoadingDialog(
          'We are processing your info....', TImages.json3);

      // //! check internet connection

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {}

      // //! form validation

      if (!signUpFormKey.currentState!.validate()) {}

      //! privacy policy check

      if (!privacyPolicy.value) {
        TLoaders.warningSnackbar(
            title: 'Accept privacy policy',
            message:
                'In order to create account you need to accept the privacy policy');
        return;
      }

      //! register the user in firebase and store the data

      final userCredential = await AuthenticationRepository.instance
          .registerWitheEmailAndPassword(
              emailC.text.trim(), passwordC.text.trim());

      //! save the authencated user data in firebase firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: emailC.text.trim(),
        firstName: firstnameC.text.trim(),
        lastName: lastnameC.text.trim(),
        phoneNumber: phonenumberC.text.trim(),
        userName: usernameC.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(newUser);

      // show success message

      TLoaders.successSnackbar(
          title: 'Congratulations',
          message:
              'Your account has been successfully created. Verify email to continue');

      // move to verify email

      Get.to(() => const VerifyEmail());
    } catch (e) {
      // stop the loading

      TFullScreenLoader.stopLoading();

      // show some generic error

      TLoaders.errorSnackbar(
        title: 'On Snap!',
        message: e.toString(),
      );
    }
  }
}
