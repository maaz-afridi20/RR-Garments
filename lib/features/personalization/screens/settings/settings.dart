import 'package:coding_with_t_ecommerce2/features/personalization/screens/profile/upload_data_to_firebase.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // -----------------------HEADER/Appbar------------------------------
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppbar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: TColors.white,
                          ),
                    ),
                  ),
                  //-----------------------user profile tile------------------------------
                  TUserProfileTile(dark: dark),
                  const SizedBox(
                    height: TSizes.spaceBwSections,
                  )
                ],
              ),
            ),

            // -----------------------BODY PART ------------------------------

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //-----------------------Account Setting------------------------------
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwItems),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      subtitle: 'Set Shopping Delivery Address',
                      title: 'My Address',
                      ontap: () => Get.to(() => const UserAddressScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      subtitle: 'Add remove products and move to checkout',
                      title: 'My Cart',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      subtitle: 'In progress and completed orders',
                      title: 'My Orders',
                      ontap: () => Get.to(() => const OrderScreen())),
                  TSettingMenuTile(
                      icon: Iconsax.bank,
                      subtitle: 'Withdraw balance to register bank account',
                      title: 'Bank Account',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      subtitle: 'List all the discounted items',
                      title: 'My Coupon',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.notification,
                      subtitle: 'Set your notification settings',
                      title: 'Notifications',
                      ontap: () {}),
                  TSettingMenuTile(
                      icon: Iconsax.security_card,
                      subtitle: 'Manage data usage and connected accounts',
                      title: 'Account privacy',
                      ontap: () {}),

                  //-----------------------App Setting------------------------------
                  const SizedBox(height: TSizes.spaceBwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBwItems),

                  TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    subtitle: 'Upload data your database',
                    title: 'Load Data',
                    ontap: () =>
                        Get.to(() => const UploadDummyDataToFirebaseScreen()),
                  ),

                  TSettingMenuTile(
                    icon: Iconsax.location,
                    subtitle: 'Set recommendations based on your location',
                    title: 'Geo Location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  TSettingMenuTile(
                      icon: Iconsax.security_user,
                      subtitle: 'Search result is safe',
                      title: 'Safe mode',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  TSettingMenuTile(
                      icon: Iconsax.image,
                      subtitle: 'Image to be seen',
                      title: 'HD image',
                      trailing: Switch(value: true, onChanged: (value) {})),
                ],
              ),
            ),

            // -----------------------LogOut------------------------------

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => TLoaders.confirmationPopUp(
                        'LogOut',
                        'Confirm',
                        'Are you confirm to logout from your account',
                        () => AuthenticationRepository.instance.logOut()),
                    child: const Text('Log Out')),
              ),
            ),

            const SizedBox(height: TSizes.spaceBwItems * 2.5),
          ],
        ),
      ),
    );
  }
}
