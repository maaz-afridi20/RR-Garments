import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price and sale price
        Row(
          children: [
            //sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.basicSecondaryColor.withOpacity(0.8),
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
            //price
            const SizedBox(width: TSizes.spaceBwItems),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBwItems),
            const TProductPriceText(
              price: '125',
              isLarge: true,
            ),
          ],
        ),

        // title
        const SizedBox(height: TSizes.spaceBwItems / 1.5),
        const TProductTitleText(title: 'Green NIKE sports shirt'),
        const SizedBox(height: TSizes.spaceBwItems / 1.5),

        // stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBwItems),
            Text('[In Stock]', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        // brand
        const SizedBox(height: TSizes.spaceBwItems / 1.5),
        Row(
          children: [
            TCircularImage(
                dark: dark,
                image: TImages.cosmeticIcon,
                width: 32,
                height: 32,
                overlayColor: dark ? TColors.white : TColors.black),
            const TBrandTitleWithVerifiedIcon(
                title: 'JIYA NOOR', brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
