import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //  ------------------------------- appbar section---------------------------------
                  THomeAppbar(),
                  //  ------------------------------- Searching section---------------------------------

                  SizedBox(height: TSizes.spaceBwSections),
                  TSearchContainer(
                    text: 'Search In Store',
                  ),
                  SizedBox(height: TSizes.spaceBwSections),

                  //  ------------------------------- Categories section---------------------------------

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Populor Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBwItems),

                        //  ------------------------------- Categories---------------------------------

                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBwSections,
                  ),
                ],
              ),
            ),
            //  ------------------------------- Body parts---------------------------------

// ---------------------------- promo banner ------------------------------------
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBwSections),

// ---------------------------- Heading ------------------------------------

                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBwItems),

// ---------------------------- popular products ------------------------------------

                  TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const TProductsCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
