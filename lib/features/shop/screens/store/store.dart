import 'package:coding_with_t_ecommerce2/common/widgets/shimmers/brand_shimmer.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    // ! the default tab controller is for the Tabbar view
    // ! otherwise it will not work
    return DefaultTabController(
      length: categories.length,
      // ! this length will be the number of tabs that we have
      child: Scaffold(
        appBar: TAppbar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(iconColor: TColors.white, onPress: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunction.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      // --------------------------Search Bar--------------------------------------
                      const SizedBox(height: TSizes.spaceBwItems),
                      const TSearchContainer(
                        text: 'Search In Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBwSections),

                      // -----------------------------Feature Brands-----------------------------------
                      TSectionHeading(
                        title: 'Feature Brands',
                        onPressed: () => Get.to(() => const AllBrandScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBwItems / 1.5),

                      // -----------------------------T Grid Layout-----------------------------------

                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const TBrandsShimmer();
                        }

                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }

                        return TGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(
                              showBorder: false,
                              brand: brand,
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                // ---------------Tabs--------------

                bottom: TTabbar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => TCategotyTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
