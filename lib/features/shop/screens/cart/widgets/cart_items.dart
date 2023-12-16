import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBwSections),
      itemBuilder: (context, index) => Column(
        children: [
          // ---------------------------Cart Items-------------------------------------
          const TCartItem(),
          if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBwItems),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    // ---------------------------Add remove button-------------------------------------
                    TProductQuantityWithAddRemoveButtons(),
                  ],
                ),
                TProductPriceText(price: '342'),
              ],
            ),
        ],
      ),
    );
  }
}
