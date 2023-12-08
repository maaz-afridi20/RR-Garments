import 'package:coding_with_t_ecommerce2/features/authentications/screens/forget_password_configuration/forget_password.dart';

import '../../../../../utils/constants/imported_statement.dart';

class RememberAndForgot extends StatelessWidget {
  const RememberAndForgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // remember me

        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            const Text(TTextStrings.rememberMe),
          ],
        ),

        // forgot password

        TextButton(
          onPressed: () => Get.to(() => const ForgetPassword()),
          child: const Text(TTextStrings.forgotPassword),
        ),
      ],
    );
  }
}
