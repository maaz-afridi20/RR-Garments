import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instace => Get.find();

  // variables

  final _db = FirebaseFirestore.instance;

  // Get all the categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      // if we want list of things then we use docs.
      final result = snapshot.docs
          .map(
            (e) => BrandModel.fromSnapshot(e),
          )
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching brands $e';
    }
  }
}
