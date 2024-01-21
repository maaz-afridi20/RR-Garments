import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class LoginController extends GetxController {
  // variables

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final rememberMe = true.obs;
  final hidePassword = true.obs;

  final userController = Get.put(UserController());

  // oninit method yaha pr compulsory nai hai
  // ye hm nay is liye banaya hai k jab b kabi hm
  // application open karein tu ye khud ba khud jo emial ki value hai
  // local storage mein wo get kr lega matlab k dobara
  // type krnay k need nai hogi
  // hm khud hii already logged in ho jayngay...
  @override
  void onInit() {
    emailC.text = localStorage.read('REMEMBER_ME_EMAIL');
    passwordC.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //
      // form validation

      if (!loginKey.currentState!.validate()) {}

      //! showing the animation of loading
      TFullScreenLoader.openLoadingDialog(
          'Logging In You :)', TImages.docerAnimation);

      // check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}

      //! save the data if remember me is enabled
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailC.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', passwordC.text.trim());
      }

      //! login the user

      // final userCredential = await AuthenticationRepository.instance
      //     .loginWithEmailAndPassword(emailC.text.trim(), passwordC.text.trim());

      //! remove the loader

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackbar(
          title: 'HURRAY', message: 'successfully logged into your account');

      //! redirect to the screen

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    }
  }

  //! googl sign in

  Future<void> googleSignIn() async {
    try {
      //! open loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You! BE PATIENT', TImages.docerAnimation);

      //! check the internet connection

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}
      //! google authentication

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record

      await userController.saveUserRecord(userCredentials);

      // after record is saved
      TFullScreenLoader.stopLoading();

      // redirect to screen

      AuthenticationRepository.instance.screenRedirect();

      // sucess message
      TLoaders.successSnackbar(title: 'Success!');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    }
  }
}
