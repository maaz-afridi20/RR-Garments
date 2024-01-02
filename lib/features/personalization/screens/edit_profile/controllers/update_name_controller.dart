import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UpdateNameController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //! fetch the user record
  Future<void> initializeNames() async {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
    userNameController.text = userController.user.value.userName;
  }

  Future<void> updateUserNames() async {
    try {
      //! start the loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing', TImages.docerAnimation);

      //! check the connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
      }

      //! form validation
      if (!updateNameFormKey.currentState!.validate()) {}

      //! update user first name and last name in firebase
      Map<String, dynamic> name = {
        'FirstName': firstNameController.text.trim(),
        'LastName': lastNameController.text.trim(),
        'UserName': userNameController.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //! update the user
      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();

      //! remove the loader
      TFullScreenLoader.stopLoading();

      //! success message
      TLoaders.successSnackbar(
          title: 'Congratulations',
          message: 'Your name has been successfully updated');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'OOPSS', message: e.toString());
    }
  }
}
