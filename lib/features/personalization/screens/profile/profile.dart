import 'package:coding_with_t_ecommerce2/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: const TAppbar(title: Text('Profile'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // ------------------------Profile picture--------------------------------

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        TCircularImage(
                            dark: dark,
                            image: TImages.userImage,
                            height: 80,
                            width: 80),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Change profile picture')),
                      ],
                    ),
                  ),
                  // ------------------------Details--------------------------------

                  const SizedBox(height: TSizes.spaceBwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBwItems),

                  const TSectionHeading(
                      title: 'Profile Information', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwItems),
                  // ------------------------Profile menu class--------------------------------
                  TProfileMenu(
                      title: 'Name', value: 'Maaz Khan', onPressed: () {}),
                  TProfileMenu(
                      title: 'Username',
                      value: 'RR Garments',
                      onPressed: () {}),

                  const SizedBox(height: TSizes.spaceBwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBwItems),

                  // ------------------------Personel info--------------------------------

                  TProfileMenu(
                      title: 'UserId',
                      value: 'manager manager',
                      icon: Iconsax.copy,
                      onPressed: () {}),
                  TProfileMenu(
                      title: 'Gmail',
                      value: 'maazkhan666.mk47@gmail.com',
                      onPressed: () {}),
                  TProfileMenu(
                      title: 'Phone Number',
                      value: '+928749284892',
                      onPressed: () {}),
                  TProfileMenu(
                      title: 'Gender', value: 'Male', onPressed: () {}),
                  TProfileMenu(
                      title: 'Date of Birth',
                      value: '28-06-1999',
                      onPressed: () {}),

                  // ------------------------Close Account--------------------------------
                  const SizedBox(height: TSizes.spaceBwItems),
                  const Divider(),

                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Close Account',
                            style: TextStyle(color: Colors.red))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
