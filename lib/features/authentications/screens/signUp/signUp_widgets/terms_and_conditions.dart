import 'package:coding_with_t_ecommerce2/features/authentications/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/imported_statement.dart';

class TTermsAndConditions extends StatelessWidget {
  const TTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpControler.instance;
    final bool dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(
              () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value,
              ),
            )),
        const SizedBox(width: TSizes.spaceBwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${TTextStrings.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ' ${TTextStrings.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? TColors.textWhiteColor
                            : TColors.textPrimaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? TColors.textWhiteColor
                            : TColors.textPrimaryColor,
                      ),
                ),
                TextSpan(
                    text: '${TTextStrings.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: TTextStrings.termOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? TColors.textWhiteColor
                            : TColors.textPrimaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? TColors.textWhiteColor
                            : TColors.textPrimaryColor,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
