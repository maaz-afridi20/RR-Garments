import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class FirebaseStorageController extends GetxController {
  FirebaseStorageController get instance => Get.find();
  final controller = TFirebaseStorageService();

  // Future uploadImagesAsAWhole() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog('Uploading', TImages.docerAnimation);

  //     controller.getImageDataFromAssets('/assets/images/products/');
  //     // controller.uploadImageData('/Categories', imagePaths, 'images/');

  //     TFullScreenLoader.stopLoading();
  //     //
  //   } catch (e) {
  //     throw 'Error uploading images $e';
  //   }
  // }

  // List imagePaths = [
  //   TImages.productImage1,
  //   TImages.productImage2,
  //   TImages.productImage3,
  //   TImages.productImage4,
  //   TImages.productImage5,
  //   TImages.productImage6,
  //   TImages.productImage7,
  //   TImages.productImage8,
  //   TImages.productImage9,
  //   TImages.productImage10,
  //   TImages.productImage11,
  //   TImages.productImage12,
  //   TImages.productImage13,
  //   TImages.productImage14,
  //   TImages.productImage5,
  //   TImages.productImage6,
  //   TImages.productImage7,
  //   TImages.productImage8,
  //   TImages.productImage19,
  //   TImages.productImage20,
  //   TImages.productImage21,
  //   TImages.productImage22,
  //   TImages.productImage23,
  //   TImages.productImage24
  // ];
}
