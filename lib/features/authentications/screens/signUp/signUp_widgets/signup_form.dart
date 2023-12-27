import 'package:coding_with_t_ecommerce2/features/authentications/controllers/signup/signup_controller.dart';
import '../../../../../utils/constants/imported_statement.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpControler());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstnameC,
                  validator: (value) =>
                      TValidators.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTextStrings.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastnameC,
                  validator: (value) =>
                      TValidators.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTextStrings.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          //
          // User name
          const SizedBox(height: TSizes.spaceBwInputFields),
          TextFormField(
            controller: controller.usernameC,
            validator: (value) =>
                TValidators.validateEmptyText('User Name', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTextStrings.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          //
          // Email
          const SizedBox(height: TSizes.spaceBwInputFields),
          TextFormField(
            controller: controller.emailC,
            validator: (value) => TValidators.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          //
          // phone number
          const SizedBox(height: TSizes.spaceBwInputFields),
          TextFormField(
            controller: controller.phonenumberC,
            validator: (value) =>
                TValidators.validateEmptyText('PhoneNo', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBwInputFields),
          //
          // passsword

          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.passwordC,
              validator: (value) =>
                  TValidators.validateEmptyText('Password', value),
              expands: false,
              decoration: InputDecoration(
                  labelText: TTextStrings.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  )),
            ),
          ),

          //
          //
          const SizedBox(height: TSizes.spaceBwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(TTextStrings.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBwSections),
        ],
      ),
    );
  }
}
