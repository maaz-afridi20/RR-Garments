import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  // save the user record from any authentication provider

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // convert the  name and to first name and lastname

        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final userName =
            UserModel.generateUserName(userCredentials.user!.displayName ?? '');

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
    } catch (e) {
      TLoaders.warningSnackbar(
          title: 'Data Not Saved',
          message:
              'something went wrong while saving the user record. you can re-save your data from profile page');
    }
  }
}
