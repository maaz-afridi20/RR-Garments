import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProductDetalsScreen extends StatelessWidget {
  const ProductDetalsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! -----------------------product image slider-----------------------

            TProductImageSlider(dark: dark),

            //! -----------------------product details-----------------------

            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                children: [
                  //! -----------------------Rating And Share-----------------------
                  const TRatingAndShare(),

                  //! -----------------------Price,Title,stock and brand -----------------------

                  const TProductMetaData(),

                  //! -----------------------Attributes-----------------------

                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBwSections),
                  //! -----------------------Checkout Button-----------------------

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),

                  //! -----------------------Description-----------------------
                  const SizedBox(height: TSizes.spaceBwSections),
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwSections),
                  //! -----------------------shor more or less-----------------------

                  const ReadMoreText(
                    'this is some random text that will be read in the next section this is some random text that will be read in the next sectionof the text file and will be read in the next section of the text file',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: ' show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  //! -----------------------Reviews-----------------------
                  const SizedBox(height: TSizes.spaceBwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Reviews(101)', showActionButton: false),
                      GestureDetector(
                          onTap: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          child: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TBottomAddToCard(),
    );
  }
}
