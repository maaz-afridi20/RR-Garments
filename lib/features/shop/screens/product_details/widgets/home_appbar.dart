import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTextStrings.homeAppbarTitle1,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: const Color.fromRGBO(255, 255, 255, 1)),
          ),
          Obx(() {
            if (controller.profileLoding.value) {
              // return the loader(shimmer effect)
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
              );
            }
          }),
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
