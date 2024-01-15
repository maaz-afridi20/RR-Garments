import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  //! variables

  RxString selectedProductImage = ''.obs;

  //! get all the images from product variations

  List<String> getAppProductImages(ProductModel product) {
    // hm nay yaha pr set use kiya hai takay unique images ko use kr sakay
    // matlab k jo aik bar use hua hai aik hii bar use krein matlab at the same time
    // dosri jagah pr use na ho...
    Set<String> images = {};

    //! load the thumbnail image
    images.add(product.thumbnail);

    //! assign the thumbnail image as selected image
    selectedProductImage.value = product.thumbnail;

    //! get all the images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //! check the variations get all the variations images from the product model
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  void showEnlargeImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace,
                        vertical: TSizes.defaultSpace * 2),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: TSizes.spaceBwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
