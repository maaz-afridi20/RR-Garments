import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'User real name for easy verification. This name will be displayed on several pages',
                  style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: TSizes.spaceBwItems),

              //! text form fields

              Form(
                key: controller.updateNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstNameController,
                      validator: (value) =>
                          TValidators.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTextStrings.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBwInputFields),
                    TextFormField(
                      controller: controller.lastNameController,
                      validator: (value) =>
                          TValidators.validateEmptyText('Last Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTextStrings.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBwInputFields),
                    TextFormField(
                      controller: controller.userNameController,
                      validator: (value) =>
                          TValidators.validateEmptyText('User Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTextStrings.username,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              //! save button

              const SizedBox(height: TSizes.spaceBwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserNames(),
                    child: 'Save'.text.make()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
