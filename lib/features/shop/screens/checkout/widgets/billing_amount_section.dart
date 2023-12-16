import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal : ', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$123', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee : ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(width: TSizes.spaceBwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee : ', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(width: TSizes.spaceBwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total : ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
