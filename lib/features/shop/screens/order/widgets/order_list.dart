import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBwItems),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (_, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.darkGrey : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //! Row 1
            Row(
              children: [
                //! Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBwItems / 2),
                //! Status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.basicPprimaryColor,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text('16 Dec 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                //! Icon buton
                IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm))
              ],
            ),
            const SizedBox(height: TSizes.spaceBwItems),
            //! Row 2nd
            Row(
              children: [
                //! first row of above 2nd row
                Expanded(
                  child: Row(
                    children: [
                      //! Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBwItems / 2),
                      //! Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('#jm2f68',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //! second row of above 2nd row
                Expanded(
                  child: Row(
                    children: [
                      //! Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBwItems / 2),
                      //! Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('05 Jan 2024',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
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
