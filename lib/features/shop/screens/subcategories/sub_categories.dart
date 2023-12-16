import 'package:coding_with_t_ecommerce2/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! Banner
              const TRoundedImage(
                  width: double.infinity,
                  imgUrl: TImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBwSections),
              //! sub categories
              Column(
                children: [
                  //! heading

                  TSectionHeading(title: 'Sport Shirt', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: TSizes.spaceBwItems),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const TProductsCardHorizontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
