import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductsCardHorizontal extends StatelessWidget {
  const TProductsCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          //! thumbnail of the product.
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.darkGrey : TColors.white,
            child: Stack(
              children: [
                //! thumbnail image.
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                      imgUrl: TImages.productImage1, applyImageRadius: true),
                ),
                //! sale tag
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
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
          //! details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                          title: 'Green Nike half sleves shirt',
                          smallSize: true),
                      SizedBox(height: TSizes.spaceBwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //! pricing
                      const Flexible(child: TProductPriceText(price: '250.0')),
                      //! Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.backgroundDarkColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconXl * 1.2,
                          height: TSizes.iconXl * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
