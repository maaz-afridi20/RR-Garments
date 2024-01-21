import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! Brand Details
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBwSections),

              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    //! loader
                    const loader = TVerticalProductShimmer();

                    //
                    final widget =
                        TCloudHelperFunctions.checkMultipleRecordState(
                            snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    //! when record found.

                    final brandProductsList = snapshot.data!;

                    return TSortableProducts(
                      products: brandProductsList,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
