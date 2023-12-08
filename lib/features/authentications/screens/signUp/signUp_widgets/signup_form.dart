import '../../../../../utils/constants/imported_statement.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunction.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
              labelText: TTextStrings.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          //
          // passsword
          const SizedBox(height: TSizes.spaceBwInputFields),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTextStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          //
          //
          const SizedBox(height: TSizes.spaceBwSections),
        ],
      ),
    );
  }
}
