import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      showBorder: true,
      backgroundColor: dark ? TColors.darkGrey : TColors.white,
      child: Row(
        children: [
          // Textfield
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'have a promo code? enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          // Button

          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? TColors.white.withOpacity(0.5)
                      : TColors.darkGrey.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
