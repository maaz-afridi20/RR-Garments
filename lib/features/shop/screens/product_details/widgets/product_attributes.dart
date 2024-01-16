import 'package:coding_with_t_ecommerce2/common/widgets/chips/choice_chip.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
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
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBwItems),
                          // sale price
                          const TProductPriceText(price: '20'),
                        ],
                      ),

                      // Stock

                      Row(
                        children: [
                          const TProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text(
                            'In Stock',
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
          children: [
            Container(),
            const TSectionHeading(title: 'Color'),
            const SizedBox(height: TSizes.spaceBwItems / 2),
            // ----------------------------choice chip------------------------------------
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    isSelected: true,
                    titleText: 'Green',
                    onSelected: (value) {}),
                TChoiceChip(
                    isSelected: false,
                    titleText: 'Purple',
                    onSelected: (value) {}),
                TChoiceChip(
                    isSelected: false,
                    titleText: 'Yellow',
                    onSelected: (value) {}),
              ],
            ),
            // ----------------------------------------------------------------
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            const TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBwItems / 2),
            // ----------------------------choice chip------------------------------------

            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    isSelected: true,
                    titleText: 'EU 34',
                    onSelected: (value) {}),
                TChoiceChip(
                    isSelected: false,
                    titleText: 'EU 36',
                    onSelected: (value) {}),
                TChoiceChip(
                    isSelected: false,
                    titleText: 'checking this ',
                    onSelected: (value) {}),
              ],
            ),

            // ----------------------------------------------------------------
          ],
        ),
      ],
    );
  }
}
