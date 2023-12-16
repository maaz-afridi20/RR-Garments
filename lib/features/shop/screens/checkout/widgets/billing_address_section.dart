import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttontitle: 'Change', onPressed: () {}),
        Text('Coding With Me', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBwItems / 2),
        Row(
          children: [
            const Icon(Iconsax.mobile, size: 16, color: Colors.grey),
            const SizedBox(width: TSizes.spaceBwItems),
            Text('+9257487648', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, size: 16, color: Colors.grey),
            const SizedBox(width: TSizes.spaceBwItems),
            Expanded(
              child: Text('main pindi road billitang kohat kpk pakistan',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBwItems / 2),
      ],
    );
  }
}
