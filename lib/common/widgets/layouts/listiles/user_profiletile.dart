import '../../../../utils/constants/imported_statement.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        dark: dark,
        image: TImages.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Maaz',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'maazafridi.ma47@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}
