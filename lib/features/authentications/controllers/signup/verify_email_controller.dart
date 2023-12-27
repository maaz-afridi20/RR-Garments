import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

// so whenever this class is called this onit function will be called
// and will send the email automatically  and also set the timer
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // send the email verification link

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackbar(
          title: 'OOpss',
          message: "Please check your inbox and verify your email");
    } catch (e) {
      TLoaders.errorSnackbar(title: 'OOpss', message: e.toString());
    }
  }

  // timer automatically redirect on email verification

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.deliveredInPlaneIllustration,
            title: TTextStrings.yourAccountCreateTitle,
            subtitle: TTextStrings.yourAccountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  // maunually send the email if verified

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.deliveredInPlaneIllustration,
          title: TTextStrings.yourAccountCreateTitle,
          subtitle: TTextStrings.yourAccountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
