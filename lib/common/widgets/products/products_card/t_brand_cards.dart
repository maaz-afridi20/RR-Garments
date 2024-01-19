import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = false,
    this.onTapp,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTapp;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTapp,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: TColors.transparent,
        child: Row(
          children: [
            // ----------------------------Icon------------------------------------
            Flexible(
              child: TCircularImage(
                dark: dark,
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: TColors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBwItems / 2),
            // ----------------------------Text------------------------------------

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    ' ${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
