import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        //! Dropdown

        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              // this will sort based on selected option
              controller.sortProducts(value!);
            },
            items: const [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList()),
        const SizedBox(height: TSizes.spaceBwSections),
        //! Products

        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductsCardVertical(
              product: controller.products[index],
            ),
          ),
        ),
      ],
    );
  }
}
