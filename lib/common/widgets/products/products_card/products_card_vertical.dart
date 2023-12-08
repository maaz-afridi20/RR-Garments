import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductsCardVertical extends StatelessWidget {
  const TProductsCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    // container with padding and color edges radius etc,
    return GestureDetector(
      onTap: () {},
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
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark
                  ? TColors.backgroundDarkColor
                  : TColors.backgroundLightColor,
              child: Stack(
                children: [
                  // -----------------------------thumbnail image-----------------------------------

                  const TRoundedImage(
                      imgUrl: TImages.productImage1, applyImageRadius: true),
                  //
                  // --------------------Sale tag------------
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor:
                          TColors.basicSecondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.backgroundDarkColor),
                      ),
                    ),
                  ),

                  // ---------------------------Favourite Icon Button-------------------------------------

                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCirculorIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBwItems / 2),
            // -----------------------------details of product,-----------------------------------

            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: "Green Nike Air Shoes",
                    smallSize: true,
                  ),
                  SizedBox(height: TSizes.spaceBwItems / 2),
                  //
                  //
                  // ---------------------------Brand title with verified icon-------------------------------------
                  TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
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
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '35.0'),
                ),
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
