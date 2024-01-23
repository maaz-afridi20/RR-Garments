import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';
import 'package:coding_with_t_ecommerce2/utils/local_storage/local_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // get authenticated user data

  User? get authUser => _auth.currentUser;

  // called from main.dart class when app launched

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
// Function to show that screen what we want to display

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        //! initilize the user specified bucket
        await TLocalStorage.init(user.uid);

        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
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
  }

  //!-----------------------------FORGOT PASSWORD-----------------------------------
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  //!-----------------------------EMAIL AND PASSWORD SIGN IN-----------------------------------

  // [EMAIL AUTHENTICATION]    sign in

  //! login in

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) print(e.code);
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) print(e.code);
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      if (kDebugMode) print(e.code);
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  //!  REGISTER..
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

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

  Future<void> logOut() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Loging you out', TImages.docerAnimation);
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      TFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
      TLoaders.successSnackbar(
          title: 'Sussessfully signed out',
          message: 'GORU BO BACHAY ZA WRAK SHAA OSS!');
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

  //!-----------------------------Re AuthenticateUser-----------------------------------

  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    //! reauthenticate
    await _auth.currentUser!.reauthenticateWithCredential(credential);

    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

//!  DELETE THE ACCOUNT

  final UserRepository _userRepository = UserRepository();

  Future<void> deleteAccount() async {
    try {
      await _userRepository.removeUserRecord(_auth.currentUser!.uid);
      // await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

//!-----------------------------Social (google and facebook) SIGN IN-----------------------------------

//! for google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // show the popup of all the email addresses
      // so the first googlesign() will open all the email addresses
      // and when you click on any of the email address that
      // will trigger the .signIn()

      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // so jo user nay account prr click kiya hoga
      // ye wala googleAuth variable uss  ki authentication ko get kr lega.
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      //
      //! for credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      //! now this will store that credentials inn the firestore
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('something went wrong : $e');
      return null;
    }
  }
}
