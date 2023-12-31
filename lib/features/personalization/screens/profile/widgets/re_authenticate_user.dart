import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(
        title: 'ReAuthenticate User'.text.make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidators.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: 'Email'),
                ),
                const SizedBox(height: TSizes.spaceBwInputFields),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidePassword.value,
                    validator: (value) =>
                        TValidators.validateEmptyText('password', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash)),
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBwSections),
                //! login button

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPassword(),
                      child: 'Vefity'.text.make()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
