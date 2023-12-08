import '../../../../../utils/constants/imported_statement.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  title

              Text(TTextStrings.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBwSections),

              // --------------------------Form--------------------------------------

              const TSignUpForm(),
              // --------------------------terms and condition-------------------------------------

              const TTermsAndConditions(),
              // --------------------------SignUp Button--------------------------------------
              const SizedBox(height: TSizes.spaceBwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const VerifyEmail()),
                  child: const Text(TTextStrings.createAccount),
                ),
              ),
              const SizedBox(height: TSizes.spaceBwSections),
              // --------------------------Divider--------------------------------------
              TFormDivider(dividerText: TTextStrings.orSignUpWith.capitalized),
              // --------------------------Footer => contains Social Buttons--------------------------------------
              const SizedBox(height: TSizes.spaceBwItems),
              const TFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
