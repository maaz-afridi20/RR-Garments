import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.futureMethod, this.query});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: TAppbar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = TVerticalProductShimmer();

              //! our custom class for checking the conditions
              final widget = TCloudHelperFunctions.checkMultipleRecordState(
                  snapshot: snapshot, loader: loader);

              //! return the appropriate widget based on snapshot.
              if (widget != null) return widget;

              //! product found

              final product = snapshot.data!;

              return TSortableProducts(
                products: product,
              );
            }),
      ),
    );
  }
}
