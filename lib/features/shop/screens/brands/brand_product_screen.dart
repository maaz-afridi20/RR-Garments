import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! Brand Details
              TBrandCard(showBorder: true, brand: BrandModel.empty()),
              const SizedBox(height: TSizes.spaceBwSections),
              const TSortableProducts(
                products: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
