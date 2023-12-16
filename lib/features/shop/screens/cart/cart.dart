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
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('CheckOut \$342'),
          ),
        ));
  }
}
