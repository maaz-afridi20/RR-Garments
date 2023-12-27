import '../../../../../utils/constants/imported_statement.dart';

class RememberAndForgot extends StatelessWidget {
  const RememberAndForgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // remember me

        Row(
          children: [
            Obx(() => Checkbox(
                  value: controller.rememberMe.value,
                  onChanged: (value) =>
                      controller.rememberMe.value !=
                      controller.rememberMe.value,
                )),
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
