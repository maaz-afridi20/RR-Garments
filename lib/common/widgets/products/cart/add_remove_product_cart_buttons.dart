import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProductQuantityWithAddRemoveButtons extends StatelessWidget {
  const TProductQuantityWithAddRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCirculorIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: THelperFunction.isDarkMode(context)
                ? TColors.white
                : TColors.black,
            backgroundColor: THelperFunction.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.lightGrey),
        const SizedBox(width: TSizes.spaceBwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBwItems),
        const TCirculorIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.basicPprimaryColor),
      ],
    );
  }
}
