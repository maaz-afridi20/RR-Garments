import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //! -----------------------------Image-----------------------------------
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBwSections),

              //! -----------------------------Title and Subtitle-----------------------------------

              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              Text(
                TTextStrings.changeYoutPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              Text(
                TTextStrings.changeYoutPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              // -----------------------------Buttons-----------------------------------

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(TTextStrings.done),
                ),
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    ForgetPasswordController.instance
                        .resendPasswordResetEmail(email);
                  },
                  child: const Text(TTextStrings.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
