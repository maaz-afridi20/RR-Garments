import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              TGridLayout(
                itemCount: 4,
                itemBuilder: (index, context) => const TProductsCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
