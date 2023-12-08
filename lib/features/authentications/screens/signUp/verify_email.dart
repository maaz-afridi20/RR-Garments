import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';
import 'package:flutter/cupertino.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // -----------------------------Image-----------------------------------

              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBwSections),

              // -----------------------------Title and Subtitle-----------------------------------

              Text(
                TTextStrings.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              Text(
                'ali@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              Text(
                TTextStrings.confirmEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              //
              // -----------------------------Buttons-----------------------------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                        title: TTextStrings.yourAccountCreateTitle,
                        subtitle: TTextStrings.yourAccountCreatedSubtitle,
                        onPressed: () => Get.off(() => const LoginScreen()),
                        image: TImages.staticSuccessIllustration,
                      )),
                  child: const Text(TTextStrings.continuue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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
