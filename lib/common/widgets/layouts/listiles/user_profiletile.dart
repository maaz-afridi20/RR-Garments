import '../../../../utils/constants/imported_statement.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      final networkImage = controller.user.value.profilePicture;
      final image = networkImage.isNotEmpty ? networkImage : TImages.userImage;
      return ListTile(
        leading: TCircularImage(
          dark: dark,
          image: image,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            icon: const Icon(
              Iconsax.edit,
              color: TColors.white,
            )),
      );
    });
  }
}
