import 'package:coding_with_t_ecommerce2/features/shop/screens/brands/brand_product_screen.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! heading

              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBwItems),

              //!Brands

              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) => TBrandCard(
                        showBorder: true,
                        onTapp: () => Get.to(() => const BrandProduct()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
