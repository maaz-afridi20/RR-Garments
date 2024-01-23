import 'package:coding_with_t_ecommerce2/common/widgets/loaders/animation_loaders.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesContoller.instance;

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
              Obx(
                () => FutureBuilder(
                  future: controller.favoritesProducts(),
                  builder: (context, snapshot) {
                    final emptyWidget = TAnimationLoaderWidget(
                      text: 'OOPS! Wishlist is empty',
                      animation: TImages.pencilDrwaing,
                      showAction: true,
                      actionText: 'let\'s add some',
                      onPressedAction: () =>
                          Get.off(() => const NavigationMenu()),
                    );

                    const loader = TVerticalProductShimmer(itemCount: 6);
                    final widget =
                        TCloudHelperFunctions.checkMultipleRecordState(
                            snapshot: snapshot,
                            loader: loader,
                            nothingFound: emptyWidget);
                    if (widget != null) return widget;
                    final products = snapshot.data!;
                    return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductsCardVertical(
                        product: products[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
