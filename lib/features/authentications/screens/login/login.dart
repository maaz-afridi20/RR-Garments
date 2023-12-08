import '../../../../../utils/constants/imported_statement.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              // logo, title, subtitle
              const TLoginHeader(),
              // ------------------------- Form ---------------------------------------

              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBwSections),
                  child: Column(
                    children: [
                      //
                      // Email
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTextStrings.email,
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBwInputFields),
                      //
                      // Password
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.password_check),
                            labelText: TTextStrings.password,
                            suffixIcon: Icon(Iconsax.eye_slash)),
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
                            onPressed: () =>
                                Get.to(() => const NavigationMenu()),
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
                      // ---------------------------divider----------------------------

                      const TFormDivider(
                          dividerText: TTextStrings.orSignInWith),

                      const SizedBox(height: TSizes.spaceBwSections),
                      // ---------------------------footer----------------------------
                      const TFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
