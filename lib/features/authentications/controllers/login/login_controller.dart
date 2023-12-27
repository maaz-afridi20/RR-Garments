import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class LoginController extends GetxController {
  // variables

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final rememberMe = true.obs;
  final hidePassword = true.obs;

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging In You', TImages.json4);

      // check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //
      // form validation

      if (!loginKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //! save the data if remember me is enabled
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailC.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', passwordC.text.trim());
      }

      //! login the user

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(emailC.text.trim(), passwordC.text.trim());

      //! remove the loader

      TFullScreenLoader.stopLoading();

      //! redirect to the screen

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    }
  }
}
