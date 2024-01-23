import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        //! handle the loader.
        const loader = Column(
          children: [
            TListTileShimmer(),
            SizedBox(height: TSizes.spaceBwItems),
            TBoxesShimmer(),
            SizedBox(height: TSizes.spaceBwItems),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultipleRecordState(
            snapshot: snapshot, loader: loader);

        if (widget != null) return widget;

        //! when record found.
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            //! for getting single record
            final brand = brands[index];

            return FutureBuilder(
                future:
                    controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  final widget = TCloudHelperFunctions.checkMultipleRecordState(
                      snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  //! record found
                  final products = snapshot.data!;
                  return TBrandShowCase(
                    dark: dark,
                    images: products.map((e) => e.thumbnail).toList(),
                    brand: brand,
                  );
                });
          },
        );
      },
    );
  }
}
