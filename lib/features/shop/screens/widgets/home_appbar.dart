import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTextStrings.homeAppbarTitle1,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
          Text(
            TTextStrings.homeAppbarSubtitleTitle1,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: Colors.white),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPress: () {},
          iconColor: TColors.textWhiteColor,
        ),
      ],
    );
  }
}
