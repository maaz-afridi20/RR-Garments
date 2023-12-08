import 'package:coding_with_t_ecommerce2/features/shop/screens/widgets/category_tab.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunction.isDarkMode(context);

    // ! the default tab controller is for the Tabbar view
    // ! otherwise it will not work
    return DefaultTabController(
      length: 5,
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
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBwItems / 1.5),

                      // -----------------------------T Grid Layout-----------------------------------

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return TBrandCard(dark: dark, showBorder: false);
                        },
                      )
                    ],
                  ),
                ),
                // ---------------Tabs--------------

                bottom: const TTabbar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Cosmetics')),
                    Tab(child: Text('Shoes')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategotyTab(),
              TCategotyTab(),
              TCategotyTab(),
              TCategotyTab(),
              TCategotyTab()
            ],
          ),
        ),
      ),
    );
  }
}
