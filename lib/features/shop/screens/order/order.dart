import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title:
            Text('My Order', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        // orders
        child: TOrderListItems(),
      ),
    );
  }
}
