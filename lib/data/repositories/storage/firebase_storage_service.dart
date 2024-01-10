import 'dart:io';

import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

// upload the local data from ide
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  //!from your assets
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      }

      throw 'some error occurred';
    }
  }

  //! from your local storage
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      }

      throw 'some error occurred';
    }
  }

  // Handle errors related to Firebase Storage
  void handleFirebaseStorageError(dynamic e) {
    if (e is FirebaseException) {
      throw 'FirebaseException: ${e.message}';
    } else if (e is SocketException) {
      throw 'Network Error: ${e.message}';
    } else if (e is PlatformException) {
      throw 'Platform Exception: ${e.message}';
    }
    throw 'Some error occurred';
  }
}
