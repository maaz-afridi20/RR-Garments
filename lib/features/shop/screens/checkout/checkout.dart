import 'package:coding_with_t_ecommerce2/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
        appBar: TAppbar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TCartItems(showAddRemoveButton: false),
                const SizedBox(height: TSizes.spaceBwSections),
                //---------------------------Coupon Textfield-------------------------------------
                const TCouponCode(),
                const SizedBox(height: TSizes.spaceBwSections),

                //---------------------------Billing Sectino-------------------------------------

                TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.md),
                  showBorder: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      //! pricing section
                      TBillingAmountSection(),

                      SizedBox(height: TSizes.spaceBwItems),
                      //! divider
                      Divider(),
                      SizedBox(height: TSizes.spaceBwItems),
                      //! payment method section
                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBwItems),
                      //! address section
                      TBillingAddressSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //! checkout button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulpayment,
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                  subtitle: 'Your Items Will Be Shipped Soon',
                  title: 'Payment Success',
                )),
            child: const Text('CheckOut \$342'),
          ),
        ));
  }
}
