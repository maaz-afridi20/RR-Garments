import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercetage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercetage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.backgroundDarkColor),
              ),
            ),
            //price
            const SizedBox(width: TSizes.spaceBwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBwItems),
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),

        //! Title
        const SizedBox(height: TSizes.spaceBwItems / 1.5),
        TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBwItems / 1.5),

        // stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status :'),
            const SizedBox(width: TSizes.spaceBwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        // brand
        const SizedBox(height: TSizes.spaceBwItems / 1.5),
        Row(
          children: [
            TCircularImage(
                dark: dark,
                image: product.brand != null ? product.brand!.image : '',
                width: 32,
                height: 32,
                overlayColor: dark ? TColors.white : TColors.black),
            TBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
