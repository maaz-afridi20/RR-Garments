import '../../../../../utils/constants/imported_statement.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: const Column(
            children: [
              // logo, title, subtitle
              TLoginHeader(),
              // ------------------------- Form ---------------------------------------

              TLoginForm(),

              // ---------------------------divider----------------------------

              TFormDivider(dividerText: TTextStrings.orSignInWith),

              SizedBox(height: TSizes.spaceBwSections),
              // ---------------------------footer----------------------------
              TFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
