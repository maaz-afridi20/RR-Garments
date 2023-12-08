import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtility.getBottomNavigationBarHeight() + 15,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.myPageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor:
              dark ? TColors.backgroundLightColor : TColors.backgroundDarkColor,
          dotHeight: 6,
        ),
        count: 3,
      ),
    );
  }
}
