import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar(
      {super.key,
      this.actions,
      this.leadingIcon,
      this.showBackArrow = false,
      this.leadingOnPressed,
      this.title});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left,
                    color: dark ? TColors.white : Colors.black),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}
