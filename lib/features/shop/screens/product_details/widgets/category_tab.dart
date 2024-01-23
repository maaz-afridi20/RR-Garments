import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCategotyTab extends StatelessWidget {
  const TCategotyTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! CATEGORIES....
              CategoryBrands(category: category),
              //! -------------Brands----------------

              // TBrandShowCase(dark: dark, images: const [
              //   TImages.productImage1,
              //   TImages.productImage2,
              //   TImages.productImage3
              // ]),
              // const SizedBox(height: TSizes.spaceBwItems),
              //! --------------Products---------------

              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response =
                      TCloudHelperFunctions.checkMultipleRecordState(
                          snapshot: snapshot,
                          loader: const TVerticalProductShimmer());
                  if (response != null) return response;

                  final products = snapshot.data!;
                  return Column(
                    children: [
                      TSectionHeading(
                        title: 'Your might like',
                        onPressed: () => Get.to(
                          () => AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          ),
                        ),
                      ),
                      //! --------------Grid layout things---------------
                      TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return TProductsCardVertical(
                              product: products[index],
                            );
                          }),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
