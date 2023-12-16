import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image...
        TRoundedImage(
          imgUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunction.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.lightGrey,
        ),
        const SizedBox(width: TSizes.spaceBwItems),

        // Title price, and size.

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child:
                    TProductTitleText(title: 'Black Sport Shoes', maxLines: 1),
              ),
              // ---------------------------For Attributes-------------------------------------

              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextSpan(
                      text: ' Green',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: ' Size',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: ' UK 06',
                      style: Theme.of(context).textTheme.bodyLarge),
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
