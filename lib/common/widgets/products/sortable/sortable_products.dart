import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Dropdown

        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
            items: const [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity',
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList()),
        const SizedBox(height: TSizes.spaceBwSections),
        //! Products

        TGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const TProductsCardVertical())
      ],
    );
  }
}
