import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // horizontal scrollable page

          PageView(
            controller: controller.myPageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTextStrings.onBoardingTitle1,
                subtitle: TTextStrings.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTextStrings.onBoardingTitle2,
                subtitle: TTextStrings.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTextStrings.onBoardingTitle3,
                subtitle: TTextStrings.onBoardingSubTitle3,
              ),
            ],
          ),

          //skip button

          const OnBoardingSkip(),

          // dot navigation smooth indicator (smooth page indicator)

          const OnboardingDotNavigation(),
          // circulor button

          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
