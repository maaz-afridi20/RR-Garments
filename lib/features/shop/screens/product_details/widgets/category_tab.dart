import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCategotyTab extends StatelessWidget {
  const TCategotyTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = ProductController.instance;

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! -------------Brands----------------

              TBrandShowCase(
                dark: dark,
                images: const [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              //! --------------Products---------------

              TSectionHeading(title: 'Your might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBwItems),
              //! --------------Grid layout things---------------

              TGridLayout(
                  itemCount: controller.featuredProductsList.length,
                  itemBuilder: (context, index) {
                    return TProductsCardVertical(
                      product: controller.featuredProductsList[index],
                    );
                  }),
              const SizedBox(height: TSizes.spaceBwSections),
            ],
          ),
        ),
      ],
    );
  }
}
