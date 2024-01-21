import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: TAppbar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCirculorIcon(icon: Iconsax.add, onPressed: () => const Home()),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const TVerticalProductShimmer();
                }

                if (controller.featuredProductsList.isEmpty) {
                  return Center(
                      child: Text('No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium));
                }

                return TGridLayout(
                  itemCount: controller.featuredProductsList.length,
                  itemBuilder: (_, index) => TProductsCardVertical(
                    product: controller.featuredProductsList[index],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
