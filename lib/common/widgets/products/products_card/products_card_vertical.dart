import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductsCardVertical extends StatelessWidget {
  const TProductsCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    // container with padding and color edges radius etc,
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetalsScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.textWhiteColor,
        ),
        child: Column(
          children: [
            // -----------------------------thumbnail,wishlist,discount tag,-----------------------------------

            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark
                  ? TColors.backgroundDarkColor
                  : TColors.backgroundLightColor,
              child: Stack(
                children: [
                  // -----------------------------thumbnail image-----------------------------------

                  Center(
                    child: TRoundedImage(
                        imgUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true),
                  ),
                  //
                  // --------------------Sale percentage tag------------
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor:
                          TColors.basicSecondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '${controller.calculateSalePercentage(product.price, product.salePrice)}%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.backgroundDarkColor),
                      ),
                    ),
                  ),

                  // ---------------------------Favourite Icon Button-------------------------------------

                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCirculorIcon(
                      backgroundColor: dark ? TColors.softGrey : TColors.white,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBwItems / 2),
            // -----------------------------details of product,-----------------------------------

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBwItems / 2),
                  //
                  //
                  // ---------------------------Brand title with verified icon-------------------------------------
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                  // ----------------------------------------------------------------
                  //
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //!price
                Flexible(
                  child: Column(
                    children: [
                      //! sale price
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            '\$${product.price}',
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ),
                      //! actual price
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(
                            price: controller.getProductPrice(product)),
                      )
                    ],
                  ),
                ),
                //! Add to cart
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.backgroundDarkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconXl * 1.2,
                    height: TSizes.iconXl * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add,
                          color: TColors.backgroundLightColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
