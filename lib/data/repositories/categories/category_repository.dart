import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //! variables
  final _db = FirebaseFirestore.instance;

  //! GET ALL THE CATEGORIES

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      // ye jo neechay hai ye single entry ko list karega one by one.
      final listt = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return listt;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      //! upload all the categories along with their names

      final storage = Get.put(TFirebaseStorageService());

      //! loop through every category
      for (var category in categories) {
        // get the image link from the local asset
        final file = await storage.getImageDataFromAssets(category.image);

        // upload the image and get the url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //! Assign url to the category names
        category.image = url;

        //! store the category to firebase
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong';
    }
  }

  // Create a list of dummy categories
  // final List<CategoryModel> dummyCategories = [
  //   CategoryModel(
  //       id: '1', name: 'Sports', image: TImages.shoeIcon, isFeatured: true),
  //   CategoryModel(
  //       id: '1',
  //       name: 'Electronics',
  //       image: TImages.sportIcon,
  //       isFeatured: true),
  //   CategoryModel(
  //       id: '1', name: 'Furniture', image: TImages.sportIcon, isFeatured: true),
  //   CategoryModel(
  //       id: '1', name: 'Cosmetics', image: TImages.sportIcon, isFeatured: true),
  //   CategoryModel(
  //       id: '1', name: 'Shoes', image: TImages.sportIcon, isFeatured: true),
  // ];
}
