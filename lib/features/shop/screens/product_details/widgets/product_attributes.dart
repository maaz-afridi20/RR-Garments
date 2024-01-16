import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                // title , price and stock status
                children: [
                  Row(
                    children: [
                      const TSectionHeading(
                          title: 'Variattions', showActionButton: false),
                      const SizedBox(width: TSizes.spaceBwItems),
                      // Actual price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                  title: 'Price : ', smallSize: true),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: TSizes.spaceBwItems),
                              // sale price
                              TProductPriceText(
                                  price: controller.getVatiationPrice()),
                            ],
                          ),

                          // Stock

                          Row(
                            children: [
                              const TProductTitleText(
                                  title: 'Stock : ', smallSize: true),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  //! --------------------------Variation description--------------------------------------

                  const TProductTitleText(
                      title:
                          'This is the description of the product that will be displayed',
                      smallSize: true,
                      maxLines: 4),
                ],
              ),
            ),

          const SizedBox(height: TSizes.spaceBwItems),

          //! -------------------------------Attributes---------------------------------

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                          title: attribute.name ?? '', showActionButton: false),
                      const SizedBox(height: TSizes.spaceBwItems / 2),
                      // ----------------------------choice chip------------------------------------
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return TChoiceChip(
                              isSelected: isSelected,
                              titleText: attributeValue,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      )
                      // ----------------------------------------------------------------
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
