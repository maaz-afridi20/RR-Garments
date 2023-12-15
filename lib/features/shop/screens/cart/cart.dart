import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBwSections),
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    // Image...
                    TRoundedImage(
                      imgUrl: TImages.productImage1,
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: THelperFunction.isDarkMode(context)
                          ? TColors.darkGrey
                          : TColors.lightGrey,
                    ),
                    const SizedBox(width: TSizes.spaceBwItems),

                    // Title price, and size.
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
