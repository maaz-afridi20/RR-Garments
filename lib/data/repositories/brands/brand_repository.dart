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

//!  get brand for category

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      // query to get all document wherer categoryId matches the provided id

      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      //!  extract all the brand ids.
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      //! query to get all the document where the brand id is in list of the brand ids
      //! fieldpath.documentId to query documents in collection

      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      //! extract the brand names or other relevant information
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
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
