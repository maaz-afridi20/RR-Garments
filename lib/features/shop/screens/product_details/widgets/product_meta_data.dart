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
          ],
        ),
        // title
        // stock status
        // brand
      ],
    );
  }
}
