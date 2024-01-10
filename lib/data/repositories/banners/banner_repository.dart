import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  //
  //! variables
  final _db = FirebaseFirestore.instance;

  //! get all the order related details.

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      //
      //! .docs will get the single document
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong $e';
    }
  }

  //! upload all the banners.
}
