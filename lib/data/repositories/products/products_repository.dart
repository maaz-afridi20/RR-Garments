import 'dart:io';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // -------------------------------VARIABLES---------------------------------

  final _db = FirebaseFirestore.instance;

  // -------------------------------FUNCTIONS---------------------------------

  //!    GET LIMITED FEATURED PRODUCT
  Future<List<ProductModel>> getFeaturedProduct() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(1)
          .get();
      final products =
          snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      // return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      print('in product repo ${products.length}');
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('in product repo try catch ${products.length}');

      throw 'some error occurred $e';
    }
  }

  //   GET ALL FEATURED PRODUCT

  //  GET FAVORITE PRODUCT BASED ON LIST OF PRODUCT IDS.

  //  FETCH PRODUCT FOR A SPECIFIC CATEGORY

  //  FETCH PRODUCT FOR A SPECIFIC BRAND

  //  SEARCH PRODUCT

//
//
//
//
  //!  UPLOAD DUMMY products DATA TO FIREBASE.

  Future<void> uploadDummyProduct(List<ProductModel> products) async {
    try {
      // upload all the product along with their images
      final storage = Get.put(TFirebaseStorageService());
      TFullScreenLoader.openLoadingDialog('Uploading', TImages.docerAnimation);
      // loop through all the products

      for (var product in products) {
        // get the image link from the local asset.
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload the image and its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign the url to the product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrls = [];
          for (var image in product.images!) {
            // get the data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // upload the image and its urls

            final url = await storage.uploadImageData(
                'Product/Images', assetImage, image);

            // assign url to product thumbnails attribute
            imageUrls.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrls);
        }

        // upload variation images

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get the image from local asset
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // upload the image and get the link
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // assign the images.
            variation.image = url;
          }
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}

// ----------------------------------------------------------------
//!
//!  below this is my own logic.

// class ProductRepository extends GetxController {
//   static ProductRepository get instance => Get.find();

//   //! variables

//   // final _db = FirebaseFirestore.instance;

//   Future<void> uploadDummyProducts(List<ProductModel> products) async {
//     try {
//       final storage = Get.put(TFirebaseStorageService());
//       final db = FirebaseFirestore.instance;

//       TFullScreenLoader.openLoadingDialog('Uploading', TImages.docerAnimation);

//       for (var product in products) {
//         // Upload thumbnail image
//         final thumbnailFile =
//             await storage.getImageDataFromAssets(product.thumbnail);
//         final thumbnailUrl = await storage.uploadImageData(
//             'Images', thumbnailFile, product.title);

//         // Create a new ProductModel instance with updated thumbnail
//         var updatedProduct = ProductModel(
//           id: product.id,
//           title: product.title,
//           stock: product.stock,
//           price: product.price,
//           isFeatured: product.isFeatured,
//           thumbnail: thumbnailUrl,
//           description: product.description,
//           brand: product.brand,
//           images: product.images,
//           salePrice: product.salePrice,
//           sku: product.sku,
//           categoryId: product.categoryId,
//           productAttributes: product.productAttributes,
//           productVariations: product.productVariations,
//           productType: product.productType,
//         );

//         // Upload product images
//         if (updatedProduct.images != null) {
//           List<String> imageUrls = [];
//           for (var image in updatedProduct.images!) {
//             final imageFile = await storage.getImageDataFromAssets(image);
//             final imageUrl = await storage.uploadImageData(
//                 'Images', imageFile, updatedProduct.title);
//             imageUrls.add(imageUrl);
//           }
//           updatedProduct.images = imageUrls;
//         }

//         // Store the product in Firebase
//         await db
//             .collection('Products')
//             .doc(updatedProduct.id)
//             .set(updatedProduct.toJson());
//       }
//     } catch (e) {
//       throw 'Error uploading products: $e';
//     } finally {
//       TFullScreenLoader.stopLoading();
//     }
//   }
// }
