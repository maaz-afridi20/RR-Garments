import 'package:coding_with_t_ecommerce2/features/shop/controllers/products/images_controller.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAppProductImages(product);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.lightGrey,
        child: Stack(
          children: [
            //! -----------------------main large image-----------------------
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: TColors.basicPprimaryColor),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // -----------------------image slider-----------------------

            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: images.length,
                  itemBuilder: (context, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        imgUrl: images[index],
                        backgroundColor: dark
                            ? TColors.backgroundDarkColor
                            : TColors.backgroundLightColor,
                        padding: const EdgeInsets.all(TSizes.sm),
                        border: Border.all(
                            color: imageSelected
                                ? TColors.basicPprimaryColor
                                : TColors.transparent),
                        onPressed: () {
                          controller.selectedProductImage.value = images[index];
                          controller.update();
                        });
                  }),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBwItems,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            //! -----------------------Appbar Icons-----------------------

            TAppbar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: product.id),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
