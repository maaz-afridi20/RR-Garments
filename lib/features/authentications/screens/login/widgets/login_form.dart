import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBwSections),
        child: Column(
          children: [
            //
            // Email
            TextFormField(
              controller: controller.emailC,
              validator: (value) => TValidators.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTextStrings.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBwInputFields),
            //
            // Password

            Obx(
              () => TextFormField(
                validator: (value) =>
                    TValidators.validateEmptyText('Password', value),
                controller: controller.passwordC,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTextStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        controller.hidePassword.value !=
                        controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBwInputFields / 2),

            // ------------------------------Remember me and forgot----------------------------------

            const RememberAndForgot(),

            //
            const SizedBox(height: TSizes.spaceBwSections),
            //
            // ---------------------------sign in and create account button-------------------------------------
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTextStrings.signIn),
                )),
            const SizedBox(height: TSizes.spaceBwItems),
            //
            //
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUp()),
                child: const Text(TTextStrings.createAccount),
              ),
            ),
            const SizedBox(height: TSizes.spaceBwItems),
          ],
        ),
      ),
    );
  }
}
