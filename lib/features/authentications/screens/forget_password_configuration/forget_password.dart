import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------------------headings------------------------------------
        
              Text(TTextStrings.forgotPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBwItems),
              Text(TTextStrings.forgotPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: TSizes.spaceBwSections * 2),
              // ------------------------------textfields----------------------------------
        
              Form(
                key: controller.forgetPasswordFormkey,
                child: TextFormField(
                  controller: controller.emailC,
                  validator: TValidators.validateEmail,
                  decoration: const InputDecoration(
                    labelText: TTextStrings.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              // ------------------------------submit button----------------------------------
        
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(TTextStrings.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
