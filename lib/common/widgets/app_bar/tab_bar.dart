import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  // if  you want to have some background colors etc add them to the
  // tabbar so you cannot do that directly you have to create
  // custom tabbar and then you can do that
  // you must use preferred size widget and the below one missing override
  const TTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.textPrimaryColor,
        labelColor: dark ? TColors.white : TColors.black,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}
