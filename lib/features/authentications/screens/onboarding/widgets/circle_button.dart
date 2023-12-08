import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          minimumSize: const Size(44, 44),
          backgroundColor:
              dark ? TColors.basicPprimaryColor : TColors.backgroundDarkColor,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
