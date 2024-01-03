import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunction.isDarkMode(context);
    final controller = UserController.instance;

    return Scaffold(
        appBar: const TAppbar(title: Text('Profile'), showBackArrow: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
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
                            Obx(() {
                              final networkImage =
                                  controller.user.value.profilePicture;
                              final image = networkImage.isNotEmpty
                                  ? networkImage
                                  : TImages.userImage;

                              return controller.isImageUploading.value
                                  ? const TShimmerEffect(
                                      width: 80, height: 80, radius: 80)
                                  : TCircularImage(
                                      dark: dark,
                                      image: image,
                                      height: 80,
                                      width: 80,
                                      isNetworkImage: networkImage.isNotEmpty,
                                    );
                            }),
                            TextButton(
                                onPressed: () =>
                                    controller.uploadUserProfileImage(),
                                child: const Text('Change profile picture')),
                          ],
                        ),
                      ),
                      // ------------------------Details--------------------------------

                      const SizedBox(height: TSizes.spaceBwItems / 2),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBwItems),

                      const TSectionHeading(
                          title: 'Profile Information',
                          showActionButton: false),
                      const SizedBox(height: TSizes.spaceBwItems),
                      // ------------------------Profile menu class--------------------------------
                      TProfileMenu(
                        title: 'Name',
                        value: controller.user.value.fullName,
                        onPressed: () => Get.to(() => const UpdateNameScreen()),
                      ),
                      TProfileMenu(
                          title: 'Username',
                          value: controller.user.value.userName,
                          onPressed: () {}),

                      const SizedBox(height: TSizes.spaceBwItems),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBwItems),

                      // ------------------------Personel info--------------------------------

                      TProfileMenu(
                          title: 'UserId',
                          value: controller.user.value.id,
                          icon: Iconsax.copy,
                          onPressed: () => controller
                              .copyToClipboard(controller.user.value.id)),
                      TProfileMenu(
                          title: 'Email',
                          value: controller.user.value.email,
                          onPressed: () {}),
                      TProfileMenu(
                          title: 'Phone Number',
                          value: controller.user.value.phoneNumber,
                          onPressed: () {}),
                      TProfileMenu(
                          title: 'Gender', value: 'Male', onPressed: () {}),
                      TProfileMenu(
                        title: 'Date of Birth',
                        value: '28-06-1999',
                        onPressed: () {},
                      ),

                      // ------------------------Close Account--------------------------------
                      const SizedBox(height: TSizes.spaceBwItems),
                      const Divider(),

                      Center(
                        child: TextButton(
                            onPressed: () =>
                                controller.deleteAccountWarningPopup(),
                            child: const Text('Delete Account Permenantly',
                                style: TextStyle(color: Colors.red))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
