import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPress,
  });

  final VoidCallback onPress;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPress,
          icon: Icon(
            Iconsax.shopping_bag,
            color: THelperFunction.isDarkMode(context)
                ? TColors.textWhiteColor
                : TColors.backgroundDarkColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
