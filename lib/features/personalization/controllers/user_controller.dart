import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  final profileLoding = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePassword = false.obs;
  final isImageUploading = false.obs;
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  Rx<UserModel> user = UserModel.empty().obs;

  // tu jab b pahlii bar ye app open hogi ye init method call hoga.
  // aik baar orr ye fetchuser record haii iss say data ko get kr lega.

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoding.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoding.value = false;
    }
  }

  // save the user record from any authentication provider

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // refresh the user record
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // convert the  name and to first name and lastname

          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final userName = UserModel.generateUserName(
              userCredentials.user!.displayName ?? '');

          //! map the user data to user model
          //

          final user = UserModel(
              email: userCredentials.user!.email ?? '',
              firstName: nameParts[0],
              id: userCredentials.user!.uid,
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              userName: userName,
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          // save the data

          await userRepository.saveUserData(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackbar(
          title: 'Data Not Saved',
          message:
              'something went wrong while saving the user record. you can re-save your data from profile page');
    }
  }

  //! deletes the user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Loading..', TImages.docerAnimation);

      //! first re authenticate the user
      //because for the deleting the user you should re authenticate the user

      final auth = AuthenticationRepository.instance;
      //ye provider ka matlab hai k ye account kiss source say login hua thaa
      // like ye google sign in thaa ya email and password say huaa tha
      // ya phone auth say huaa thaaa tu ye providre jo haai iss ko get
      // kr lega.. k ye kisss source say login huaa  thaa ye account

      // you can also use this method instead of below like

      // FirebaseAuth.instance.currentUser!.providerData
      //     .map((e) => e.providerId)
      //     .first;

      // ye b same hii kaam karega....

      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackbar(title: 'OHH', message: e.toString());
    }
  }

  //! ReAuthenticate the user

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog('Loading..', TImages.docerAnimation);

      //! check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {}

      //! validate the user
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackbar(title: 'Oh!.', message: e.toString());
    }
  }

  //! only it will show the popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete permanently! this action will delete the account permanently',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  //! updload the image

  uploadUserProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);
      if (image != null) {
        isImageUploading.value = true;

        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // update the user record.
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackbar(
            title: 'Congratulations',
            message: 'profile picture has been updated successfully');
      }
    } catch (e) {
      TLoaders.errorSnackbar(
          title: 'OOPSS', message: 'Something went wrong $e');
    } finally {
      isImageUploading.value = false;
    }
  }

  Future<void> copyToClipboard(String texToCopy) async {
    await Clipboard.setData(ClipboardData(text: texToCopy));
    TLoaders.successSnackbar(
        title: 'UID Copied to clipboard', message: texToCopy);
  }
}
