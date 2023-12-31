import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables

  final emailC = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      //! form validation
      if (!forgetPasswordFormkey.currentState!.validate()) {}

      //!  start the loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.docerAnimation);

      //! check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}

      //! Authentication(sending the reset password)
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(emailC.text.trim());
      TFullScreenLoader.stopLoading();

      //! show the success message
      TLoaders.successSnackbar(
          title: 'Email Sent',
          message:
              'email link sent click on the email link to resent your password'
                  .tr);

      //! redirect to the screen
      Get.to(() => ResetPasswordScreen(
            email: emailC.text.trim().tr,
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'OOPS', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {} catch (e) {
      try {
        //!  start the loading
        TFullScreenLoader.openLoadingDialog(
            'Processing your request', TImages.docerAnimation);

        //! check the internet connection
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          TFullScreenLoader.stopLoading();
          return;
        }

        //! Authentication(sending the reset password)
        await AuthenticationRepository.instance.sendPasswordResetEmail(email);
        TFullScreenLoader.stopLoading();

        //! show the success message
        TLoaders.successSnackbar(
            title: 'Email Sent',
            message:
                'email link sent click on the email link to resent your password'
                    .tr);
      } catch (e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackbar(title: 'OOPS', message: e.toString());
      }
    }
  }
}
